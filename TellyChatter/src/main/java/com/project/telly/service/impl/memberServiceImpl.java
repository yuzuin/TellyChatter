package com.project.telly.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.telly.service.memberService;
import com.project.telly.service.dao.memberDAO;
import com.project.telly.vo.memberVO;

@Service("memberService")
public class memberServiceImpl implements memberService{
	
	@Inject
	private memberDAO memberMapper;
	
	@Override
	@Transactional
	/* 회원가입 */
	public int insertMember(memberVO vo) {
		return memberMapper.insertMember(vo);
	}

	@Override
	@Transactional
	/* 로그인 */
	public memberVO login(memberVO vo) {
		return memberMapper.login(vo);
	}

	@Override
	@Transactional
	public Integer selectPoint(String id) {
		return memberMapper.selectPoint(id);
	}
	
	/* 포인트 추가 */
	@Override
	@Transactional
	public int updatePointReview(String id) {
		return memberMapper.updatePointReview(id);
	}

	/*writer 정보 가져오기*/
	@Override
	@Transactional
	public memberVO selectWriter(String id) {
		return memberMapper.selectWriter(id);
	}

	@Override
	@Transactional
	public List<memberVO> selectTopWriter() {
		return memberMapper.selectTopWriter();
	}

	@Override
	@Transactional
	public int updateMyInfo(memberVO vo) {
		return memberMapper.updateMyInfo(vo);
	}

}
