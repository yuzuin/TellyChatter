package com.project.telly.vo;

public class PageNumber {
	private int page;  // 현재 기준 페이지
	private int count;  // 총 글수
	private int pageCnt=10;
	
	// 위의 세가지 변수로 아래 변수를 계산 할 수 있다. 
	private int start;  // 페이지그룹 시작 번호
	private int end;    // 페이지그룹 끝 번호
	private int nowPageStart;  //표시될 페이지 시작번호
	private int nowPageEnd;    //표시될 페이지 끝번호
	private int prev=0;;
	private int next=0;
	private int nnn;
	private String word;
	

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public Integer getPage() {
		return page;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPage(Integer page) {
		if (page < 1) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setCount(Integer count) {
		if (count < 1) {
			return;
		}
		this.count = count;
		calcPage();
	}

	public int getCount() {
		return count;
	}

	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}

	public int getPrev() {
		return prev;
	}

	public int getNext() {
		return next;
	}

	public int getNowPageStart() {
		nnn=nowPageStart;
		return nowPageStart;
	}

	public int getNowPageEnd() {
		return nowPageEnd;
	}
	

	public int getNnn() {
		return nnn;
	}

	public void setNnn(int nnn) {
		this.nnn = nnn;
	}

	private void calcPage() {// page 계산
		int tempEnd = (int) (Math.ceil(page / (float)pageCnt) * pageCnt); // 페이지 전체수 구하기  
		                                                                  // page가 10미만이면 10까지부 11이상부터는 20
		System.out.println("this.count =" + this.count);
		
		// 시작페이지 구하기
		this.start = tempEnd - 9;
		
		if(start > pageCnt) {    //시작페이지가 10보다 클 경우는 이전 페이지가 있음.
			prev=start-pageCnt;
		}
		
		if (tempEnd * pageCnt > this.count) { // 
			this.end = (int) Math.ceil(this.count / (float)pageCnt);
		} else {
			this.end = tempEnd; // ���� count��
			next=end+1;
			// tempEnd���� �������
		}
		
		nowPageStart = (page-1)*pageCnt;
		nowPageEnd = nowPageStart + pageCnt;
		nnn=nowPageStart;
		if(nowPageEnd > this.count) {
			nowPageEnd=this.count;
		}
		
		
		System.out.println("page = " + page);
		System.out.println("start = " + start);
		System.out.println("this.end = " + this.end);
		System.out.println("nowpageStart= " + this.nowPageStart);
		System.out.println("nowpageEnd= " + this.nowPageEnd);
	}
}