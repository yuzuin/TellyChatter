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
public class BoardListController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardListController.class);
	@Inject 
	private memberService memberService;
	@Inject
	private FileDataUtil filedataUtil;
	@Inject
	private reviewService reviewService;
	
	/* 리뷰 오름차순 정렬 */
}
