package com.project.telly.service;

import java.util.List;

import com.project.telly.vo.showVO;

public interface showService {
	public int insertShow(showVO vo);
	public List<showVO> showList();
	public showVO selectShow(int num);
	public int updateShow(showVO vo);
}
