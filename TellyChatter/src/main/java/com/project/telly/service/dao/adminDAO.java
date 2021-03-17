package com.project.telly.service.dao;

import org.springframework.stereotype.Service;

import com.project.telly.vo.visitCountVO;

public interface adminDAO{
	public int insertVisitor(visitCountVO vo);
}
