package com.keduit.service;

import java.util.List;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;

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
	
	//페이징처리 메서드
	public List<BoardVO> getList(Criteria cri);
	
	//검색한 데이터 불러오기
	public int getTotal(Criteria cri);
}
