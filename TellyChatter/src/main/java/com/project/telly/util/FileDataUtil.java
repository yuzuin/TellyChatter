package com.project.telly.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileDataUtil {
	
	private ArrayList<String> extNameArray = new ArrayList<String>() 
	{
		{
			add("gif");
			add("jpg");
			add("png");
		}
	};
	//첨부파일 업로드 경로 변수값으로 가져옴 servlet-context.xml
	@Resource(name="uploadPath")
	private String uploadPath;
	
	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	/**
	 * 게시물 상세보기에서 첨부파일 다운로드 메서드 구현(공통)
	 */
	//@ResponseBody
	//메서드의 return 값을 HTTP Response의 body에 담는 역할을 합니다
	//@ResponseBody 어노테이션을 이용하면 자바 객체를 HTTP 응답 몸체로 전송할 수 있다.
	@RequestMapping(value="/download", method=RequestMethod.GET)
	@ResponseBody  
	public FileSystemResource fileDownload(@RequestParam("filename") String fileName, HttpServletResponse response) {
		File file = new File(uploadPath + "/" + fileName);
		response.setContentType("application/download; utf-8");  // 파일의 종류 설정 - 다운로드 받을 수 있도록 설정
		response.setHeader("Content-Disposition", "attachment; filename=" + fileName); // 응답 객체에 파일 이름을 설정
		return new FileSystemResource(file);
	}
	
	/**
	 * 파일 업로드 메서드(공통)
	 * @throws IOException 
	 */
	public String[] fileUpload(MultipartFile file) throws IOException {
		String originalName = file.getOriginalFilename();//jsp에서 전송받은 파일의 이름 가져옴
		UUID uid = UUID.randomUUID();//랜덤문자 구하기
		String saveName = uid.toString() + "." + originalName.split("\\.")[1];//한글 파일명 처리 때문에... 랜덤문자 후 확장자 붙히기
		String[] files = new String[] {saveName};//형변환
		byte[] fileData = file.getBytes();	//	tcp 바이트 변환같은거
		File target = new File(uploadPath, saveName);	//	자바 jvm(램)에서 하드디스크에 있는 파일을 연결하는 객체, 파일객체의 위치 만들기
		FileCopyUtils.copy(fileData, target);	//	내용을 전송해라
		return files;	//	실제 저장될 파일명
	}

	public ArrayList<String> getExtNameArray() {
		return extNameArray;
	}

	public void setExtNameArray(ArrayList<String> extNameArray) {
		this.extNameArray = extNameArray;
	}
}