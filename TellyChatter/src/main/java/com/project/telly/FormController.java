package com.project.telly;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.project.telly.service.memberService;
import com.project.telly.util.FileDataUtil;
import com.project.telly.vo.memberVO;


/** 폼 제출 관리 컨트롤러 */
@Controller
public class FormController {
	
	@Inject	//	인젝션 대신..
	private memberService memberService;
	@Inject
	private FileDataUtil filedataUtil;
	
	/* 회원가입 제출 */
	@RequestMapping(value = "goRegister", method = RequestMethod.POST)
	public String goRegister(memberVO mem, MultipartFile file) throws Exception {
		if(file.getOriginalFilename()=="") {
			System.out.println("첨부파일 없음");
			mem.setProfileImg("nullProfile");
		}else {
			String[] files = filedataUtil.fileUpload(file);
			System.out.println("파일 : "+files[0]);
			mem.setProfileImg(files[0]);
		}
		if(memberService.insertMember(mem)>0) {
			System.out.println("ok리턴");
		}
		return "index";	//	리다이렉트로 
	}
	
}
