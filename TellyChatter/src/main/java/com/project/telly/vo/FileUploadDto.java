package com.project.telly.vo;

import org.springframework.web.multipart.MultipartFile;

@SuppressWarnings("Serial")
public class FileUploadDto {

		private String CKEditorFuncNum;
		private String newFilename;
		private MultipartFile upload;
		private String imageUrl;
		
		public String getCKEditorFuncNum() {
			return CKEditorFuncNum;
		}
		
		public void setCKEditorFuncNum(String ckEditorFuncNum) {
			CKEditorFuncNum = ckEditorFuncNum;
		}

		public String getNewFilename() {
			return newFilename;
		}

		public void setNewFilename(String newFilename) {
			this.newFilename = newFilename;
		}

		public MultipartFile getUpload() {
			return upload;
		}

		public void setUpload(MultipartFile upload) {
			this.upload = upload;
		}

		public String getImageUrl() {
			return imageUrl;
		}

		public void setImageUrl(String imageUrl) {
			this.imageUrl = imageUrl;
		}
		
}
