package com.project.telly.vo;

public class showCommentVO {
	private String writer;
	private String content;
	private String writetime;
	private int showNum;
	private int num;
	private int star;
	
	
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritetime() {
		return writetime;
	}
	public void setWritetime(String writetime) {
		this.writetime = writetime;
	}
	public int getShowNum() {
		return showNum;
	}
	public void setShowNum(int showNum) {
		this.showNum = showNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
