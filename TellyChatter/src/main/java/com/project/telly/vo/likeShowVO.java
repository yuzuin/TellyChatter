package com.project.telly.vo;

public class likeShowVO {
	private String id;
	private int showNum;
	private String likeTime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getShowNum() {
		return showNum;
	}
	public void setShowNum(int showNum) {
		this.showNum = showNum;
	}
	public String getLikeTime() {
		return likeTime;
	}
	public void setLikeTime(String likeTime) {
		this.likeTime = likeTime;
	}
	
//	@Override
//	public String toString() {
//		return "likeShowVO [id="+id+",showNum="+showNum+",likeTime="+likeTime+"]";
//	}
}
