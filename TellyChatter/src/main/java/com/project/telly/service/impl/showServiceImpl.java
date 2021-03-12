package com.project.telly.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.telly.service.showService;
import com.project.telly.service.dao.showDAO;
import com.project.telly.vo.showVO;

@Service("showService")
public class showServiceImpl implements showService{
	@Inject
	private showDAO showMapper;

	@Override
	@Transactional
	public int insertShow(showVO vo) {
		return showMapper.insertShow(vo);
	}

	@Override
	@Transactional
	public List<showVO> showList() {
		return showMapper.showList();
	}

}
