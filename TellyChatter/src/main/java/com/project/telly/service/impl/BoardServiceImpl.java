package com.project.telly.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.telly.service.BoardService;
import com.project.telly.service.dao.BoardDAO;
import com.project.telly.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO boardMapper;
	
	@Override
	@Transactional
	public List<BoardVO> selectBoardList(){
		List<BoardVO> board = boardMapper.selectBoardList();
		System.out.println("보드 " +board);
		return boardMapper.selectBoardList();
	}

}
