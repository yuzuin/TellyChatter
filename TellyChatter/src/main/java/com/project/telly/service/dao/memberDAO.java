package com.project.telly.service.dao;

import java.util.List;

import com.project.telly.vo.memberVO;

public interface memberDAO {
	public int insertMember(memberVO vo);
	public memberVO login(memberVO vo);
	public Integer selectPoint(String id);
	public int updatePointReview(String id);
	public memberVO selectWriter(String id);
	public List<memberVO> selectTopWriter();
}
