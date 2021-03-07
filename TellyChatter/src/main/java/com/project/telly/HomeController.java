package com.project.telly;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.telly.service.BoardService;
import com.project.telly.vo.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "boardList")
	public String boardList(Model model) throws Exception {

	    List<BoardVO> list = boardService.selectBoardList();
	    logger.info(list.toString());
	    model.addAttribute("list", list);
	    return "boardList";
	}


	
}
