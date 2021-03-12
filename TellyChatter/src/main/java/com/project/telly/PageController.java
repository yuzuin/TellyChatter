package com.project.telly;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.telly.service.memberService;
import com.project.telly.service.reviewService;
import com.project.telly.util.Crawler;
import com.project.telly.util.FileDataUtil;
import com.project.telly.vo.memberVO;
import com.project.telly.vo.naverMovieDTO;
import com.project.telly.vo.reviewVO;

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

	private Crawler crawler;

	/* 홈 페이지 (index) */
	@RequestMapping(value = { "/", "index" })
	public String index(Model m, HttpServletRequest request) {

		// 로그인 검사
		HttpSession session = request.getSession();
		memberVO user = (memberVO) session.getAttribute("user");

		// 영화 순위 크롤링
		ArrayList<naverMovieDTO> movies = crawler.movieGetter();
		System.out.println(movies.get(3).getInfo()); // 테스트
		m.addAttribute("movieRanking", movies);

		// 탑리뷰
		List<reviewVO> topReviews = reviewService.topReviews();
		m.addAttribute("topReviews", topReviews);
		m.addAttribute("topWriter", memberService.selectTopWriter());
		ArrayList<String> cSize = new ArrayList<>();
		cSize.add(String.valueOf(reviewService.countReviewComment(topReviews.get(0).getNum())));
		cSize.add(String.valueOf(reviewService.countReviewComment(topReviews.get(1).getNum())));
		cSize.add(String.valueOf(reviewService.countReviewComment(topReviews.get(2).getNum())));
		m.addAttribute("cSize", cSize);

		// 뿌려주기
		m.addAttribute("user", user);
		return "index";
	}

	/* 블로그 홈 */
	@RequestMapping(value = "tellylogHome")
	public String tellylogHome(Model m, HttpServletRequest request) {
		// 로그인 검사
		HttpSession session = request.getSession();
		memberVO user = (memberVO) session.getAttribute("user");

		// 뿌려주기
		m.addAttribute("user", user);

		return "blogHome";
	}

	/* view Post 글 하나 보기 */
	@RequestMapping(value = "viewPost", method = RequestMethod.GET)
	public String viewPost(Model m) {

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

	/**
	 * 리뷰 홈 화면 리뷰 likes로 내림차순 정렬 리뷰 writetime으로 내림차순 정렬
	 */
	@RequestMapping(value = "listReview")
	public String listReview(Model model) {

		model.addAttribute("topReviews", reviewService.topReviews());
		model.addAttribute("latestReviews", reviewService.latestReviews());

		return "listReview";
	}

	/* 리뷰 view */
	@RequestMapping(value = "viewReview")
	public String viewReview(@RequestParam("viewNum") int vnum, Model model) {
		reviewVO vo = reviewService.viewReview(vnum);
		model.addAttribute("review", vo);
		String otts = "";
		if (vo.getNetflix() != '0')
			otts = otts + "넷플릭스\t";
		if (vo.getWatcha() != '0')
			otts = otts + "왓챠\t";
		if (vo.getWavve() != '0')
			otts = otts + "웨이브\t";
		if (vo.getLaftel() != '0')
			otts = otts + "라프텔\t";
		if (vo.getKakao() != '0')
			otts = otts + "카카오TV\t";
		if (vo.getCoupang() != '0')
			otts = otts + "쿠팡플레이\t";
		if (vo.getNaver() != '0')
			otts = otts + "네이버 시리즈온\t";
		String comments = String.valueOf(reviewService.countReviewComment(vnum));

		model.addAttribute("cSize", comments);
		model.addAttribute("otts", otts);
		return "viewReview";
	}

	/* 리뷰 수정 화면 */
	@RequestMapping(value = "updateReview")
	public String updateReview(@RequestParam("modNum") int mnum, Model model) {
		model.addAttribute("review", reviewService.viewReview(mnum));
		return "updateReview";
	}

}
