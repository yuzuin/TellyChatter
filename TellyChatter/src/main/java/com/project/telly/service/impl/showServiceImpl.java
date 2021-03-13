package com.project.telly.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.telly.service.showService;
import com.project.telly.service.dao.showDAO;
import com.project.telly.vo.showCommentVO;
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

	@Override
	@Transactional
	public showVO selectShow(int num) {
		return showMapper.selectShow(num);
	}

	@Override
	@Transactional
	public int updateShow(showVO vo) {
		return showMapper.updateShow(vo);
	}

	@Override
	@Transactional
	public int insertShowComment(showCommentVO vo) {
		return showMapper.insertShowComment(vo);
	}

	@Override
	@Transactional
	public int updateShowComment(showCommentVO vo) {
		return showMapper.updateShowComment(vo);
	}

	@Override
	@Transactional
	public List<showCommentVO> selectShowComment(int showNum) {
		return showMapper.selectShowComment(showNum);
	}

	@Override
	@Transactional
	public int deleteShowComment(String writer) {
		return showMapper.deleteShowComment(writer);
	}

}
