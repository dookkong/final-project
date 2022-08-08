package com.keduit.mapper;

import java.util.List;

import com.keduit.domain.BoardVO;

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
}
