package com.project.telly.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.project.telly.service.dao.adminDAO;
import com.project.telly.service.impl.adminServiceImpl;
import com.project.telly.vo.visitCountVO;

public class visitCount implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		 WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
         //등록되어있는 빈을 사용할수 있도록 설정해준다
         HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
         //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
         adminDAO admin = (adminDAO)wac.getBean("adminDAO");
         visitCountVO vo = new visitCountVO();
         vo.setVisitIp(req.getRemoteAddr());
         vo.setVisitAgent(req.getHeader("User-Agent"));	//	브라우저 정보
         vo.setVisitRefer(req.getHeader("referer"));
         admin.insertVisitor(vo);
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

}
