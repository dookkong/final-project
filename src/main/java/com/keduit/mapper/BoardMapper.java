package com.keduit.mapper;

import java.util.List;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;

public interface BoardMapper {
	//list 뿌려주기
	public List<BoardVO> getlist();
	
	//게시글 insert
	public void insert(BoardVO vo);
	
	//게시글 조회 (키 값(bno)를 이용하여 read)
	public BoardVO read(Long bno); 
	
	//게시글 삭제
	public int delete(Long bno);
	
	//게시글 수정
	public int update(BoardVO vo);
	
	//파라미터를 받아서 페이징처리 sql 처리 메소드
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	//Criteria 내부의 검색 조건을 이용하여 데이터를 뿌려주기 위해 파라미터로 받는다.
	public int getTotalCount(Criteria cri);
}
