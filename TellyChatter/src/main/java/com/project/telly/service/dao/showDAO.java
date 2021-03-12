package com.project.telly.service.dao;

import java.util.List;

import com.project.telly.vo.showVO;

public interface showDAO {
	public int insertShow(showVO vo);
	public List<showVO> showList();
	public showVO selectShow(int num);
}

