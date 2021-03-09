package com.project.telly;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.project.telly.service.memberService;
import com.project.telly.util.FileDataUtil;
import com.project.telly.vo.memberVO;


/** 폼 제출 관리 컨트롤러 */
@Controller
public class FormController {
	
	@Inject	//	인젝션 대신..
	private memberService memberService;
	@Inject
	private FileDataUtil filedataUtil;
	
	/* 회원가입 제출 */
	@RequestMapping(value = "goRegister", method = RequestMethod.POST)
	public String goRegister(memberVO mem, MultipartFile file) throws Exception {
		if(file.getOriginalFilename()=="") {
			System.out.println("첨부파일 없음");
			mem.setProfileImg("nullProfile.png");
		}else {
			String[] files = filedataUtil.fileUpload(file);
			System.out.println("파일 : "+files[0]);
			mem.setProfileImg(files[0]);
		}
		if(memberService.insertMember(mem)>0) {
			System.out.println("ok리턴");
		}
		return "registerForm";	//	리다이렉트로 
	}
	
	/* 로그인 제출 */
	@RequestMapping(value = "goLogin", method = RequestMethod.POST)
	public String goLogin(memberVO mem, HttpServletRequest request) {
		memberVO user = memberService.login(mem);
		if(user!=null) {
			//	세션 등록
			HttpSession session = request.getSession();
			System.out.println(user.getId());
			session.setAttribute("userid", user.getId()); //	세션에 "userid"로 id 넘겨줌
			session.setAttribute("userImg", user.getProfileImg());	//	세션에 프로필 이미지 넘김
			System.out.println(user.getNickname()+"님 로그인 완료");
			return "redirect:index";
		}else {
			System.out.println("로그인 실패");
			return "registerForm";
		}
	}
	
	/* 로그아웃 */
	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();	//	현재 쿠키값으로 설정되어있는 모든 세션 비움
		return "redirect:index";
	}
}
