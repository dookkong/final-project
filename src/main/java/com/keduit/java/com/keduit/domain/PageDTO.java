package com.keduit.domain;

import lombok.Data;

@Data
public class PageDTO {
	
	//페이지 계산하는 클래스
	/*페이지 번호 계산은 1페이지부터하는 것보다
	1. 마지막 페이지의 번호를 먼저 구해서 계산하는 것이 편하다.
	 (시작 페이지 번호)3/10.0 => 0.3 => ceil => 1 => 1*10 => 10 (마지막페이지번호)
	 (시작 페이지 번호)11/10.0 => 1.1 => ceil => 2 => 2*10 => 20 (마지막 페이지 번호)
	2. 마지막 페이지 번호 -9 => 시작 페이지 번호
	3. 하지만 데이터의 양에 따라 마지막 페이지가 더 적을 수 있기 때문에 다시 한번 계산한다.
	 마지막 페이지 *** 전체 데이터의 개수 => 최종 마지막 페이지
	 */
	
	private int startPage, endPage; //시작, 끝 페이지 번호
	private boolean prev, next; //다음, 이전
	private int total; //total count
	private Criteria cri;
	private int nextNum;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//마지막 페이지 먼저 계산(해당 마지막페이지는 10페이지씩 자르기 위한 것)
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		
		//시작 페이지 계산
		this.startPage = this.endPage-9;
		
		//realEndPage 계산(정확한 마지막 페이지)
		//total에 1.0을 곱하는 이유는 소수점을 만들기 위한 것
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		
		//realEnd가 endPage보다 작거나 같으면 endPage => realEnd
		this.endPage = realEnd <= endPage? realEnd : endPage;
		
		//다음
		this.next = this.endPage < realEnd;
		
		//이전(시작 페이지가 1보다 클 경우 이전 페이지 존재)
		this.prev = this.startPage > 1;
		
	}
	
}
