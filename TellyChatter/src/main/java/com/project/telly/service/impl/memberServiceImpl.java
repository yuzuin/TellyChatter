package com.project.telly.service.impl;

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

}
