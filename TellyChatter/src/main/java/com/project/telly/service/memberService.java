package com.project.telly.service;

import com.project.telly.vo.memberVO;

public interface memberService {
	public int insertMember(memberVO vo);
	public memberVO login(memberVO vo);
	public Integer selectPoint(String id);
	public int updatePointReview(String id);
}
