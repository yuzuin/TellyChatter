package com.project.telly.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.telly.service.dao.adminDAO;
import com.project.telly.vo.visitCountVO;

@Service("adminDAO")
public class adminServiceImpl implements adminDAO{
	
	@Inject
	private adminDAO adminMapper;

	@Override
	public int insertVisitor(visitCountVO vo) {
		return adminMapper.insertVisitor(vo);
	}

}
