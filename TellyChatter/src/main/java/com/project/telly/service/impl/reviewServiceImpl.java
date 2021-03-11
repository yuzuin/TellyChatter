package com.project.telly.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.telly.service.reviewService;
import com.project.telly.service.dao.reviewDAO;
import com.project.telly.vo.reviewCommentVO;
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
	
	@Override
	@Transactional
	/* 하트 숫자로 리뷰 내림차순 정렬 */
	public List<reviewVO> topReviews(){
		return reviewMapper.topReviews();
	}

	/* 최근글 */
	@Override
	@Transactional
	public List<reviewVO> latestReviews() {
		return reviewMapper.latestReviews();
	}

	/* 글 하나 보기 */
	@Override
	@Transactional
	public reviewVO viewReview(int viewNum) {
		return reviewMapper.viewReview(viewNum);
	}
	
	
	/**
	 * 리뷰 댓글 쓰기
	 */
	@Override
	@Transactional
	public int insertReviewComment(reviewCommentVO vo) {
		return reviewMapper.insertReviewComment(vo);
	}

	@Override
	@Transactional
	public List<reviewCommentVO> selectReviewComment(int rnum) {
		return reviewMapper.selectReviewComment(rnum);
	}

	@Override
	@Transactional
	public int deleteReviewComment(int num) {
		return reviewMapper.deleteReviewComment(num);
	}

	@Override
	@Transactional
	public int updateReviewComment(reviewCommentVO vo) {
		return reviewMapper.updateReviewComment(vo);
	}

	@Override
	@Transactional
	public int countReviewComment(int num) {
		return reviewMapper.countReviewComment(num);
	}

	/* 리뷰삭 */
	@Override
	@Transactional
	public void deleteReview(int num) {
		reviewMapper.deleteReview(num);
	}

	/* 리뷰수정 */
	@Override
	@Transactional
	public int updateReview(reviewVO vo) {
		return reviewMapper.updateReview(vo);
	}
	
	
}
