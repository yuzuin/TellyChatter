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
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.telly.service.memberService;
import com.project.telly.service.reviewService;
import com.project.telly.service.showService;
import com.project.telly.util.Crawler;
import com.project.telly.util.FileDataUtil;
import com.project.telly.vo.PageNumber;
import com.project.telly.vo.memberVO;
import com.project.telly.vo.myLikeReviewVO;
import com.project.telly.vo.myLikeShowVO;
import com.project.telly.vo.naverMovieDTO;
import com.project.telly.vo.onelineShowVO;
import com.project.telly.vo.reviewVO;
import com.project.telly.vo.showVO;

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
	@Inject
	private showService showService;
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
	@RequestMapping(value = "listReview", method = RequestMethod.GET)
	public String listReview(Model model, HttpServletRequest request) {

		model.addAttribute("topReviews", reviewService.topReviews());
		model.addAttribute("latestReviews", reviewService.latestReviews());
		
		int nowPage=1;
		if(request.getParameter("page")!=null) {	//	클라이언트가 클릭하면 파라미터 받음
			nowPage=Integer.valueOf(request.getParameter("page"));
		}
		int pageTotal = reviewService.allCount();
//		int pageTotal = postdao.allcount();	//	기존 dao 왜냐하면 현재 mybatis에는 select count(*) from ~ 가 없음 추후 추가
		PageNumber pagemaker = new PageNumber();
		pagemaker.setPage(nowPage);
		pagemaker.setCount(pageTotal);
		
		model.addAttribute("postList",reviewService.listAll(pagemaker));
		model.addAttribute("pageMaker",pagemaker);
		model.addAttribute("reviewList","reviewList");
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
	
	/** 영화 목록 */
	@RequestMapping(value = "shows")
	public String shows(Model m) {
		m.addAttribute("show",showService.showList());
		return "shows";
	}
	
	/** 영화 등록 */
	@RequestMapping(value = "showForm")
	public String showForm() {
		return "showForm";
	}
	
	/** 영화 디테일 */
	@RequestMapping(value = "showDetail")
	public String showDetail(@RequestParam("snum") int num, Model m) {
		m.addAttribute("show",showService.selectShow(num));
		int allStar = showService.selectShowComment(num).size();
		float stars=0;
		try {
			stars = (float)showService.selectStar(num)/allStar;
		} catch (Exception e) {
		}
		String star = String.valueOf(stars);
		m.addAttribute("star",star);
		return "showDetail";
	}
	
	/** 영화 수정 */
	@RequestMapping(value = "updateShowForm")
	public String updateShowForm(@RequestParam("snum") int num, Model m) {
		m.addAttribute("show",showService.selectShow(num));
		return "updateShowForm";
	}
	
	/* 내정보 */
	@RequestMapping(value = "myInfo")
	public String myInfo(Model m) {
		return "myInfo";
	}
	
	/* myTellyLog */
	@RequestMapping(value = "myTellyLog")
	public String myTellyLog(Model m) {
		return "myTellyLog";
	}
	
	/** 내가 찜한 리뷰 */
	@RequestMapping(value = "myLikeReview")
	@ResponseBody
	public List<myLikeReviewVO> myLikeReview(String id,HttpServletRequest request, Model model) {
		List<myLikeReviewVO> vo = reviewService.myLikeReview(id);
		return vo;
	}
	
	/** 내가 쓴 리뷰 */
	@RequestMapping(value = "myReview")
	@ResponseBody
	public List<reviewVO> myReview(String id,HttpServletRequest request, Model model) {
		List<reviewVO> vo = reviewService.myReview(id);
		return vo;
	}
	
	/** 내가 찜한 영화 */
	@RequestMapping(value = "myLikeShow")
	@ResponseBody
	public List<myLikeShowVO> myLikeShow(String id,HttpServletRequest request, Model model) {
		List<myLikeShowVO> vo = showService.myLikeShow(id);
		return vo;
	}
	
	/** 내가 올린 영화 */
	@RequestMapping(value = "myUploadShow")
	@ResponseBody
	public List<showVO> myUploadShow(String id,HttpServletRequest request, Model model) {
		List<showVO> vo = showService.myUploadShow(id);
		return vo;
	}
	/** 내가 한줄평한 영화 */
	@RequestMapping(value = "myOneLineShow")
	@ResponseBody
	public List<onelineShowVO> myOneLineShow(String id,HttpServletRequest request, Model model) {
		List<onelineShowVO> vo = showService.oneLineShow(id);
		return vo;
	}
	
	@RequestMapping(value = "allSearch")
	public String allSearch(String id,HttpServletRequest request, Model model) {
		return "allSearch";
	}
   
}
