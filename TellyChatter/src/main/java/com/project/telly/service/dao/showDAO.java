package com.project.telly.service.dao;

import java.util.List;

import com.project.telly.vo.showCommentVO;
import com.project.telly.vo.showVO;

public interface showDAO {
	public int insertShow(showVO vo);
	public List<showVO> showList();
	public showVO selectShow(int num);
	public int updateShow(showVO vo);
	
	public int insertShowComment(showCommentVO vo);
	public int updateShowComment(showCommentVO vo);
	public List<showCommentVO> selectShowComment(int showNum);
	public int deleteShowComment(String writer);
}

