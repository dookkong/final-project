package com.keduit.service;

import java.util.List;

import com.keduit.domain.BoardVO;

public interface BoardService {
	//새 글 작성
	public Long register(BoardVO vo);
	
	//1건 조회 (상세보기)
	public BoardVO get(Long bno);
	
	//1건 수정하기
	public int modify(BoardVO vo);
	
	//1건 삭제하기
	public int remove(Long bno);
	
	//list 불러오기
	public List<BoardVO> getlist();
}
