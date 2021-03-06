package com.project.telly.service.dao;

import java.util.List;

import com.project.telly.vo.PageNumber;
import com.project.telly.vo.likeReviewVO;
import com.project.telly.vo.myLikeReviewVO;
import com.project.telly.vo.reviewCommentVO;
import com.project.telly.vo.reviewVO;

public interface reviewDAO {
	public int insertReview(reviewVO vo);
	public List<reviewVO> topReviews();
	public List<reviewVO> latestReviews();
	public reviewVO viewReview(int viewNum);
	public void deleteReview(int num);
	public int updateReview(reviewVO vo);
	
	public int insertReviewComment(reviewCommentVO vo);
	public List<reviewCommentVO> selectReviewComment(int rnum);
	public int deleteReviewComment(int num);
	public int updateReviewComment(reviewCommentVO vo);
	public int countReviewComment(int num);
	
	public int likeReview(likeReviewVO vo);
	public int updateLikeReview(int num);
	public int cancleLikeReview(int num);
	public int deleteLike(likeReviewVO vo);
	public int cntLikeReview(int num);
	
	public List<myLikeReviewVO> myLikeReview(String id);
	public List<reviewVO> myReview(String writer);
	
	public List<reviewVO> listAll(PageNumber dto);
	public int allCount();
	
	public List<reviewVO> searchReview(PageNumber dto);
	public int searchReviewCnt(String word);
}
