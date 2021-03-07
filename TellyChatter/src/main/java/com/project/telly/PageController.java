package com.project.telly;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/** 페이지 관리 컨트롤러 */
@Controller
public class PageController {
	
	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	/* 홈 페이지 (index) */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		
		return "index";
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
	
}
