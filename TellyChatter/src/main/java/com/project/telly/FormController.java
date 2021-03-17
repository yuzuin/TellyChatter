package com.project.telly;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.telly.service.memberService;
import com.project.telly.service.reviewService;
import com.project.telly.service.showService;
import com.project.telly.util.FileDataUtil;
import com.project.telly.vo.PageNumber;
import com.project.telly.vo.cntLikeDTO;
import com.project.telly.vo.likeReviewVO;
import com.project.telly.vo.likeShowVO;
import com.project.telly.vo.memberVO;
import com.project.telly.vo.reviewCommentVO;
import com.project.telly.vo.reviewVO;
import com.project.telly.vo.showCommentVO;
import com.project.telly.vo.showVO;

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
	@Inject
	private showService showService;
	
	
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
	public String goLogin(memberVO mem, HttpServletRequest request, HttpServletResponse response) throws IOException {
		memberVO user = memberService.login(mem);
		HttpSession session = request.getSession();
		if (user != null) {
			// 세션 등록
			System.out.println(user.getId());
			session.setAttribute("user", user);
			System.out.println(user.getNickname() + "님 로그인 완료");
			return "redirect:index";
		} else {
			System.out.println("로그인 실패");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인에 실패했습니다. 정보를 확인해주세요.');location.href='registerForm'</script>");
			out.flush();
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
		rv.setWriterImg(nowUser.getProfileImg());
		rv.setWriter(writer); // 현재 세션의 id를 writer에 셋
		
		//	리뷰 썸네일
		int begin = 0;
		if(rv.getDescription().contains("<img alt=")) {
			begin = rv.getDescription().indexOf("<img alt=\"\" src=")+17;
			String tmp = rv.getDescription().substring(begin);
			System.out.println(tmp);
			int end = begin+tmp.indexOf('"');
			String img = rv.getDescription().substring(begin,end);
			System.out.println("자른 이미지 소스 :"+img);
			rv.setThumbnail(img);
		}
		if(reviewService.insertReview(rv)>0) {
			memberService.updatePointReview(writer);	//	포인트 추가
		}
		return "redirect:listReview";
	}
	
	/** 리뷰 삭제 */
	@RequestMapping(value = "deleteReview", method = RequestMethod.GET)
	public String deleteReview(@RequestParam("delNum") int dnum, HttpServletRequest request) {
			
		reviewService.deleteReview(dnum);
		System.out.println("리뷰 삭제 완료 ");

		return "redirect:listReview"; // 리다이렉트로
	}
	
	/** 리뷰 수정 */
	@RequestMapping(value = "UpdateReviewSubmit", method = RequestMethod.POST)
	public String UpdateReviewSubmit(reviewVO vo, Model m) {
		System.out.println("업데이트 리뷰");
		if(reviewService.updateReview(vo)>0) {
			System.out.println("업뎃완료");
		}else {
			System.out.println("업뎃실패");
		}
		
		m.addAttribute("review",reviewService.viewReview(vo.getNum()));
		
//		String otts = "";
//		if(vo.getNetflix()!='0') otts=otts + "넷플릭스\t";
//		if(vo.getWatcha()!='0') otts=otts+"왓챠\t";
//		if(vo.getWavve()!='0') otts=otts+"웨이브\t";
//		if(vo.getLaftel()!='0') otts=otts+"라프텔\t";
//		if(vo.getKakao()!='0') otts=otts+"카카오TV\t";
//		if(vo.getCoupang()!='0') otts=otts+"쿠팡플레이\t";
//		if(vo.getNaver()!='0') otts=otts+"네이버 시리즈온\t";
//		String comments = String.valueOf(reviewService.countReviewComment(vo.getNum()));
//		
//		m.addAttribute("cSize",comments);
//		m.addAttribute("otts",otts);
		return "redirect:viewReview?viewNum="+vo.getNum();
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
		/*
		String cSize = String.valueOf(vo.size());
		model.addAttribute("cSize",cSize);	//	코멘트 개수
		System.out.println(cSize);
		if(vo!=null) {
			System.out.println("쿼리문실행");
		}
		*/
		return vo;
	}
	
	/** 리뷰 댓글 삭제 */
	@RequestMapping(value = "deleteReviewComment/{num}")
	@ResponseBody
	public int deleteReviewComment(@PathVariable int num,HttpServletRequest request, Model model) {
		System.out.println("딜리트 리뷰 코멘트");
		return reviewService.deleteReviewComment(num);
	}
	
	/** 리뷰 댓글 업데이트(수정) */
	@RequestMapping(value = "updateReviewComment")
	@ResponseBody
	public int updateReviewComment(@RequestParam int num, @RequestParam String content) {
		System.out.println("업데이트 리뷰 코멘트");
		reviewCommentVO rcv = new reviewCommentVO();
		rcv.setNum(num);
		rcv.setContent(content);
		
		return reviewService.updateReviewComment(rcv);
	}

	/** 리뷰 좋아요 버튼 누름 */
	@RequestMapping(value = "likeReview", method = RequestMethod.POST)
	@ResponseBody
	public String likeReview(likeReviewVO lr,HttpServletRequest request) {
		System.out.println("리뷰 좋아요하기 ");
		// 실행
		try {
			System.out.println(lr.getId());
			System.out.println(lr.getNum());
			if (reviewService.likeReview(lr) > 0) {
				reviewService.updateLikeReview(lr.getNum());	//	리뷰 likes+1
				System.out.println("좋아요 인서트 완료");
				int aa = reviewService.viewReview(lr.getNum()).getLikes();
				System.out.println("aa값"+aa);
				return String.valueOf(aa);
			}else {
				System.out.println("좋아요 실패 ");
			}
			
		}catch(Exception e) {
			System.out.println("오류났기때문에 좋아요 취소");
			reviewService.deleteLike(lr);
			System.out.println("좋아요취소");
			reviewService.cancleLikeReview(lr.getNum());
			System.out.println("좋아요 하나 삭제");
			int aa = reviewService.viewReview(lr.getNum()).getLikes();
			System.out.println("aa값"+aa);
			return String.valueOf(aa);
		}
		return "ㅋ"; // 리다이렉트로
	}
	
	/** 리뷰 검색 */
	@RequestMapping(value="searchReview", method = RequestMethod.GET)
	public String searchReview(String word, Model m,HttpServletRequest request){
		System.out.println("리뷰 서치 "+word);
		int nowPage=1;
		if(request.getParameter("page")!=null) {	//	클라이언트가 클릭하면 파라미터 받음
			nowPage=Integer.valueOf(request.getParameter("page"));
		}
		int pageTotal = reviewService.searchReviewCnt(word);
		PageNumber pagemaker = new PageNumber();
		pagemaker.setWord(word);
		pagemaker.setPage(nowPage);
		pagemaker.setCount(pageTotal);
		m.addAttribute("pageMaker",pagemaker);
		m.addAttribute("postList",reviewService.searchReview(pagemaker));
		
		return "listReview";
	}
	
	
	
	/* 영화 관련 */
	
	/** 영화 인서트 */
	@RequestMapping(value = "insertShow", method = RequestMethod.POST)
	public String insertShow(showVO s, MultipartFile file, Model m, HttpServletRequest request) throws Exception {
		System.out.println("연도"+s.getYear());
		System.out.println("스는사람"+s.getFirstPer());
		if (file.getOriginalFilename() == "") {
			System.out.println("첨부파일 없음");
		} else {
			String[] files = filedataUtil.fileUpload(file);
			System.out.println("파일 : " + files[0]);
			s.setPoster(files[0]);
		}
		if (showService.insertShow(s) > 0) {
			System.out.println("영화 넣기 성공");
		}
		return "redirect:shows"; // 리다이렉트로
	}
	/** 영화 업데이트 */
	@RequestMapping(value = "updateShow", method = RequestMethod.POST)
	public String updateShow(showVO vo, Model m) {
		showService.updateShow(vo);
		
		m.addAttribute("show",showService.selectShow(vo.getShowNum()));
		return "showDetail";
	}
	
	/** 영화 좋아요 버튼 누름 */
	@RequestMapping(value = "likeShow", method = RequestMethod.POST)
	@ResponseBody
	public String likeShow(likeShowVO lr,HttpServletRequest request,Model m) {
		System.out.println("영화 좋아요하기 ");
		// 실행
		try {
			if (showService.likeShow(lr) > 0) {
				showService.updateLikeShow(lr.getShowNum());
				System.out.println("좋아요 인서트 완료");
			}else {
				System.out.println("좋아요 실패 ");
			}
			
		}catch(Exception e) {
			System.out.println("오류났기때문에 좋아요 취소");
			showService.deleteLikeShow(lr);
			System.out.println("좋아요취소");
			showService.cancelLikeShow(lr.getShowNum());
			System.out.println("좋아요 하나 삭제");
		}
		m.addAttribute("showAfter",showService.selectShow(lr.getShowNum()));

		return "index"; // 리다이렉트로
	}
	
	/* 영화 댓글 */
	/** 영화 댓글 리스트 */
	@RequestMapping(value = "selectShowComment")
	@ResponseBody
	public List<showCommentVO> selectShowComment(int bno,HttpServletRequest request, Model model) {
		System.out.println("셀렉트show코멘트");
		List<showCommentVO> vo = showService.selectShowComment(bno);
		return vo;
	}
	/** 영화 댓글 쓰기 */
	@RequestMapping(value = "insertShowComment", method = RequestMethod.POST)
	@ResponseBody
	public String insertShowComment(showCommentVO rcv, HttpServletRequest request) {
		System.out.println("인서트show코멘트");
		HttpSession session = request.getSession();
		memberVO nowUser = (memberVO) session.getAttribute("user");
		String writer = nowUser.getId();
		rcv.setWriter(writer); // 현재 세션의 id를 writer에 셋
		// 실행
		showService.insertShowComment(rcv);
		System.out.println("스타"+rcv.getStar());

		// 포인트 추가
		/** if (memberService.updatePointReview(writer) > 0) {
		*	System.out.println("포인트 추가 완료 ");
		*} */


		return "index"; // 리다이렉트로
	}
	/** 영화 댓글 삭제 */
	@RequestMapping(value = "deleteShowComment/{num}")
	@ResponseBody
	public int deleteShowComment(@PathVariable int num,HttpServletRequest request, Model model) {
		System.out.println("딜리트 show 코멘트");
		return showService.deleteShowComment(num);
	}
	/** 영화 댓글 업데이트(수정) */
	@RequestMapping(value = "updateShowComment")
	@ResponseBody
	public int updateShowComment(@RequestParam int num, @RequestParam String content) {
		System.out.println("업데이트 리뷰 코멘트");
		showCommentVO rcv = new showCommentVO();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String newTime = f.format(time);
		rcv.setWritetime(newTime);
		rcv.setContent(content);
		
		return showService.updateShowComment(rcv);
	}

	/** 좋아요개수 */
	@RequestMapping(value = "cntShowLikes")
	@ResponseBody
	public String cntShowLikes(int bno,HttpServletRequest request, Model model) {
		System.out.println("하트개수");
		System.out.println("showNum "+bno);
		int likesCnt = showService.cntShowLikes(bno);
		cntLikeDTO cnt = new cntLikeDTO();
		cnt.setLikes(likesCnt);
		System.out.println(cnt.getLikes());
		cnt.setNum(bno);
		return String.valueOf(cnt.getLikes());
	}
	
	/** 쇼 검색 */
	@RequestMapping(value="searchShow", method = RequestMethod.GET)
	public String searchShow(String word, Model m){
		System.out.println("영화 서치 "+word);
		
		m.addAttribute("show",showService.searchShow(word));
		
		return "shows";
	}
	
	/* 내정보 관련 */
	
	/** 정보 업데이트 */
	@RequestMapping(value = "updateMyInfo", method = RequestMethod.POST)
	public String updateMyInfo(HttpServletRequest request, memberVO mem, MultipartFile file) throws Exception {
		if (file.getOriginalFilename() == "") {
			System.out.println("첨부파일 없음");
		} else {
			String[] files = filedataUtil.fileUpload(file);
			System.out.println("파일 : " + files[0]);
			mem.setProfileImg(files[0]);
		}
		if (memberService.updateMyInfo(mem) > 0) {
			System.out.println("ok리턴");
		}
		
		memberVO user = memberService.login(mem);
		HttpSession session = request.getSession();
		//session.invalidate();
		session.setAttribute("user", user);
		return "redirect:myInfo"; // 리다이렉트로
	}
	
	/* 모든 서치 */
	@RequestMapping(value="searchAll", method = RequestMethod.GET)
	public String searchAll(String word, Model m, HttpServletRequest request){
		System.out.println("모든 서치 "+word);
		int nowPage=1;
		if(request.getParameter("page")!=null) {	//	클라이언트가 클릭하면 파라미터 받음
			nowPage=Integer.valueOf(request.getParameter("page"));
		}
		int pageTotal = reviewService.searchReviewCnt(word);
		PageNumber pagemaker = new PageNumber();
		pagemaker.setWord(word);
		pagemaker.setPage(nowPage);
		pagemaker.setCount(pageTotal);
		m.addAttribute("sword",word);
		m.addAttribute("pageMaker",pagemaker);
		m.addAttribute("show",showService.searchShow(word));
		m.addAttribute("postList",reviewService.searchReview(pagemaker));
		
		return "allSearch";
	}
	
}
