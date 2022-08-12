package com.keduit.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum; //페이지 수
	private int amount; //한 페이지 당 글의 개수
	private String type; //검색 유형 T, C, W, TC, TCW, CW
	private String keyword; //검색어
	
	//초기값은 기본 생성자로 정해줘야 한다.
	public Criteria() {
		pageNum = 1;
		amount = 20;
		
		//1페이지당 게시글 20개 //초기값
	}
	
	//매개변수로 들어오는 값을 이용하여 조정 가능
	public Criteria(int pageNum, int amount){
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	//검색조건이 각 글자(T, W, C)로 구성 되어 있으므로, 검색 조건을 배열로 만들어서 한 번에 처리
	public String[] getTypeArr() { //split() : String 객체를 지정한 구분자를 이용하여 여러개의 문자열로 나눔
		return type == null? new String[] {} : type.split(""); //문자로 나눔
		//null일 경우 오류가 나기 때문에 빈 배열을 만들어준다.
	}
	
	//UriComponentsBuilder를 이용하여 링크 생성
	//여러 개의 파라미터를 연결하여 url 형태로 만들어준다.
	public String getLinkList() { 
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("") 
				 .queryParam("pageNum", this.pageNum)
	 			 .queryParam("amount", this.amount) 
	 			 .queryParam("type", this.type)
	 			 .queryParam("keyword", this.keyword);
	 
		return builder.toUriString(); //toUriString() : uri 문자열을 빌드한다.
	}
	 
}
