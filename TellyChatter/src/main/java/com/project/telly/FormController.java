package com.project.telly;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.telly.service.memberService;
import com.project.telly.service.reviewService;
import com.project.telly.util.FileDataUtil;
import com.project.telly.vo.memberVO;
import com.project.telly.vo.reviewCommentVO;
import com.project.telly.vo.reviewVO;

/** 폼 제출 관리 컨트롤러 */
@Controller
public class FormController {

	private static final Logger logger = LoggerFactory.getLogger(FormController.class);

	@Inject // 인젝션 대신..
	private memberService memberService;
	@Inject
	private FileDataUtil filedataUtil;
	@Inject
	private reviewService reviewService;

	/* 회원가입 제출 */
	@RequestMapping(value = "goRegister", method = RequestMethod.POST)
	public String goRegister(memberVO mem, MultipartFile file) throws Exception {
		if (file.getOriginalFilename() == "") {
			System.out.println("첨부파일 없음");
			mem.setProfileImg("nullProfile.png");
		} else {
			String[] files = filedataUtil.fileUpload(file);
			System.out.println("파일 : " + files[0]);
			mem.setProfileImg(files[0]);
		}
		if (memberService.insertMember(mem) > 0) {
			System.out.println("ok리턴");
		}
		return "registerForm"; // 리다이렉트로
	}

	/* 로그인 제출 */
	@RequestMapping(value = "goLogin", method = RequestMethod.POST)
	public String goLogin(memberVO mem, HttpServletRequest request) {
		memberVO user = memberService.login(mem);
		if (user != null) {
			// 세션 등록
			HttpSession session = request.getSession();
			System.out.println(user.getId());
			session.setAttribute("user", user);
			/**
			 * System.out.println("데이지포인"+memberService.selectPoint("daisy"));
			 * System.out.println("생년월일 "+user.getBirth()); System.out.println("포인트 :
			 * "+user.getPoint());
			 */
			System.out.println(user.getNickname() + "님 로그인 완료");
			return "redirect:index";
		} else {
			System.out.println("로그인 실패");
			return "registerForm";
		}
	}

	/* 로그아웃 */
	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate(); // 현재 쿠키값으로 설정되어있는 모든 세션 비움
		return "redirect:index";
	}

	/* 리뷰 이미지 업로드 */
	@RequestMapping(value = "imageUpload.do", method = RequestMethod.POST)
	// 이미지를 저장하고, 불러오고, 업로드하기위해 매개변수를 선언
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {

			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// 이미지 경로 생성
			String path = "C:/tmp/" + "ckImage/"; // fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
			System.out.println(path);
			String ckUploadPath = path + uid + "_" + fileName;
			File folder = new File(path);

			// 해당 디렉토리 확인
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // 폴더 생성
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl = "showImg?uid=" + uid + "&fileName=" + fileName; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

	@RequestMapping(value = "showImg")
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 서버에 저장된 이미지 경로
		String path = "C:/tmp/" + "ckImage/";

		String sDirPath = path + uid + "_" + fileName;

		File imgFile = new File(sDirPath);

		// 사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
		if (imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;

			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;

			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();

				while ((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}

				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();

			} catch (IOException e) {
				logger.info(String.valueOf(e));
			} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}

	/* 리뷰 글 쓰기 */
	@RequestMapping(value = "insertReview", method = RequestMethod.POST)
	public String insertReview(reviewVO rv, HttpServletRequest request) {
		System.out.println("인서트리뷰");
		HttpSession session = request.getSession();
		memberVO nowUser = (memberVO) session.getAttribute("user");
		String writer = nowUser.getId();
		rv.setWriter(writer); // 현재 세션의 id를 writer에 셋
		// 실행

		if (reviewService.insertReview(rv) > 0) {
			System.out.println("리뷰 올림");
		}
		// 포인트 추가
		if (memberService.updatePointReview(writer) > 0) {
			System.out.println("포인트 추가 완료 ");
		}


		return "index"; // 리다이렉트로
	}
	
	/** 리뷰 댓글 쓰기 */
	@RequestMapping(value = "insertReviewComment", method = RequestMethod.POST)
	@ResponseBody
	public String insertReviewComment(reviewCommentVO rcv, HttpServletRequest request) {
		System.out.println("인서트리뷰코멘트");
		HttpSession session = request.getSession();
		memberVO nowUser = (memberVO) session.getAttribute("user");
		String writer = nowUser.getId();
		rcv.setWriter(writer); // 현재 세션의 id를 writer에 셋
		// 실행

		if (reviewService.insertReviewComment(rcv) > 0) {
			System.out.println("리뷰 코멘트 올림");
		}
		
		// 포인트 추가
		/** if (memberService.updatePointReview(writer) > 0) {
		*	System.out.println("포인트 추가 완료 ");
		*} */


		return "index"; // 리다이렉트로
	}
	
	/** 리뷰 댓글 리스트 */
	@RequestMapping(value = "selectReviewComment")
	@ResponseBody
	public List<reviewCommentVO> selectReviewComment(int bno,HttpServletRequest request, Model model) {
		System.out.println("셀렉트리뷰코멘트");
		System.out.println("bno "+bno);
		List<reviewCommentVO> vo = reviewService.selectReviewComment(bno);
		if(vo!=null) {
			System.out.println("쿼리문실행");
		}else {
			System.out.println("시발");
		}

		return vo;
	}
}
