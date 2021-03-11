package com.project.telly;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.telly.service.memberService;
import com.project.telly.service.reviewService;
import com.project.telly.util.FileDataUtil;
import com.project.telly.vo.memberVO;


/** 페이지 관리 컨트롤러 */
@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	@Inject 
	private memberService memberService;
	@Inject
	private FileDataUtil filedataUtil;
	@Inject
	private reviewService reviewService;
	
	/* 홈 페이지 (index) */
	@RequestMapping(value = {"/","index"})
	public String index(Model m, HttpServletRequest request) {
		
		//	로그인 검사
		HttpSession session = request.getSession();
		memberVO user = (memberVO) session.getAttribute("user");
		
		//	뿌려주기
		m.addAttribute("user",user);
		return "index";
	}
	
	/* 블로그 홈 */
	@RequestMapping(value = "tellylogHome")
	public String tellylogHome(Model m, HttpServletRequest request) {
			//		로그인 검사
			HttpSession session = request.getSession();
			memberVO user = (memberVO) session.getAttribute("user");
			
			//	뿌려주기
			m.addAttribute("user",user);
			
		return "blogHome";
	}
	
	/* view Post 글 하나 보기 */
	@RequestMapping(value = "viewPost", method = RequestMethod.GET)
	public String viewPost() {
		
		return "viewPost";
	}
	
	/* 폼, 테이블 등 자료 */
	@RequestMapping(value = "ex", method = RequestMethod.GET)
	public String viewEx() {
		
		return "ex";
	}
	
	/* 로그인 화면 */
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
		
		return "loginForm";
	}
	
	/* 회원가입 화면 */
	@RequestMapping(value = "registerForm", method = RequestMethod.GET)
	public String registerForm() {
		
		return "registerForm";
	}
	
	/* 리뷰 글 쓰기 화면 */
	@RequestMapping(value = "writeReview")
	public String writeReview() {
		
		return "writeReview";
	}
	
	/** 리뷰 홈 화면 
	 * 리뷰 likes로 내림차순 정렬 
	 * 리뷰 writetime으로 내림차순 정렬 */
	@RequestMapping(value = "listReview")
	public String listReview(Model model) {
		
		model.addAttribute("topReviews",reviewService.topReviews());
		model.addAttribute("latestReviews",reviewService.latestReviews());
		
		return "listReview";
	}
	
}
