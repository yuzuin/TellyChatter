package com.project.telly.service;

import java.util.List;

import com.project.telly.vo.reviewCommentVO;
import com.project.telly.vo.reviewVO;

public interface reviewService {
	public int insertReview(reviewVO vo);
	public List<reviewVO> topReviews();
	public List<reviewVO> latestReviews();
	public reviewVO viewReview(int viewNum);
	public int insertReviewComment(reviewCommentVO vo);
	public List<reviewCommentVO> selectReviewComment(int rnum);
}
