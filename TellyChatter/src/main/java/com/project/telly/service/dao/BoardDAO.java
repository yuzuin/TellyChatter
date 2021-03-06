package com.project.telly.service.dao;

import java.util.List;
import com.project.telly.vo.BoardVO;

public interface BoardDAO {
	List<BoardVO> selectBoardList();
}