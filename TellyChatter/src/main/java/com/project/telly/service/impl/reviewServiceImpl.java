package com.project.telly.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.telly.service.reviewService;
import com.project.telly.service.dao.reviewDAO;
import com.project.telly.vo.reviewVO;

@Service("reviewService")
public class reviewServiceImpl implements reviewService{

	@Inject
	private reviewDAO reviewMapper;

	@Override
	@Transactional
	
	/* 리뷰 글 쓰기 */
	public int insertReview(reviewVO vo) {
		return reviewMapper.insertReview(vo);
	}
}
