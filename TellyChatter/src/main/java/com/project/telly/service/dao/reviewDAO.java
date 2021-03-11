package com.project.telly.service.dao;

import java.util.List;

import com.project.telly.vo.reviewVO;

public interface reviewDAO {
	public int insertReview(reviewVO vo);
	public List<reviewVO> topReviews();
	public List<reviewVO> latestReviews();
	public reviewVO viewReview(int viewNum);
}
