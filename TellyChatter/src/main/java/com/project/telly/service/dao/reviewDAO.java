package com.project.telly.service.dao;

import java.util.List;

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
}
