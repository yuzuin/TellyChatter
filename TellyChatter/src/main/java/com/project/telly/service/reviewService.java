package com.project.telly.service;

import java.util.List;

import com.project.telly.vo.likeReviewVO;
import com.project.telly.vo.reviewCommentVO;
import com.project.telly.vo.reviewVO;

public interface reviewService {
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
}
