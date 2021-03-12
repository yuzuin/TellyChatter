package com.project.telly.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.project.telly.vo.naverMovieDTO;

public class Crawler {
	// 크롤러
	//static ArrayList<naverMovieDTO> movieList = new ArrayList<>();
	public static void main(String[] args) {

//		// Jsoup를 이용해서 http://www.cgv.co.kr/movies/ 크롤링
//				String url = "https://movie.naver.com/movie/running/current.nhn"; //크롤링할 url지정
//				Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
//
//				try {
//					doc = Jsoup.connect(url).get();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//				//select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
//				Elements element = doc.select("li");    
//
//				System.out.println("============================================================");
//
//				//Iterator을 사용하여 하나씩 값 가져오기
//				Iterator<Element> ie1 = element.select("dt.tit").iterator();
//				Iterator<Element> ie2 = element.select("dd").iterator();
//				Iterator<Element> ie3 = element.select("img").iterator();
//				
//				naverMovieDTO movie=new naverMovieDTO();
//				for(int i=0;i<5;i++) {
//					movie.setTitle(ie1.next().text());
//					movie.setInfo(ie2.next().text());
//					movie.setImg(ie3.next().text());
//					
//					movieList.add(movie);
//				}
//				        
//				/**
//				while (ie1.hasNext()) {
//					System.out.println(ie1.next().text()+"\t"+ie2.next().text()+"\t"+ie3.next());
//				}
//				*/
//				
//				System.out.println("============================================================");
		movieGetter();
	}

	public static ArrayList<naverMovieDTO> movieGetter() {
		ArrayList<naverMovieDTO> movieList = new ArrayList<>();
		naverMovieDTO[] movies = new naverMovieDTO[6];
		// Jsoup를 이용해서 http://www.cgv.co.kr/movies/ 크롤링
		String url = "http://www.cgv.co.kr/movies/"; //크롤링할 url지정
		Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
		Elements element = doc.select("ol");    

		System.out.println("============================================================");

		//Iterator을 사용하여 하나씩 값 가져오기
		Iterator<Element> ie1 = element.select("strong.title").iterator();
		Iterator<Element> ie2 = element.select("span.txt-info").iterator();
		Iterator<Element> ie3 = element.select("span.thumb-image").iterator();
		Iterator<Element> ie4 = element.select("div.box-contents>a").iterator();
		
		int i=0;
		while(ie1.hasNext()) {
			String imgSrc = ie3.next().getElementsByAttribute("src").attr("src");	//	이미지 소스
			String detailLink = ie4.next().getElementsByAttribute("href").attr("href");	//	뮤비 디테일
			naverMovieDTO movie=new naverMovieDTO();
			movie.setTitle(ie1.next().text());
			movie.setInfo(ie2.next().text());
			movie.setImg(imgSrc);
			movie.setDetail(detailLink);
			movieList.add(movie);
			movies[i]=movie;
			System.out.println(movieList.get(i).getTitle());
			System.out.println(movieList.get(i).getInfo());
			System.out.println("이미지	  "+movieList.get(i).getImg());
			i++;
			
			if(i>5) break;
		
		}
		
		return movieList;
	}
}
