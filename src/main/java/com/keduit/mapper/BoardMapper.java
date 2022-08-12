package com.keduit.mapper;

import java.util.List;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;

public interface BoardMapper {
	//list 뿌려주기
	public List<BoardVO> CompanyValList(Criteria cri);
	public List<BoardVO> InterviewAnsList(Criteria cri);
	public List<BoardVO> PasslatterList(Criteria cri);
	public List<BoardVO> WorryQnAList(Criteria cri);
	public List<BoardVO> PassSelfIntroductList(Criteria cri);
	//페이징처리
	public List<BoardVO> CompanyValPaging(Criteria cri);
	public List<BoardVO> InterviewAnsPaging(Criteria cri);
	public List<BoardVO> PasslatterPaging(Criteria cri);
	public List<BoardVO> WorryQnAPaging(Criteria cri);
	public List<BoardVO> PassSelfIntroductPaging(Criteria cri);
	//게시글 insert
	public void insert(BoardVO vo);
	
	public void insertSelectKey(BoardVO board);
	
	//게시글 조회 (키 값(bno)를 이용하여 read)
	public BoardVO CompanyValread(Long bno); 
	public BoardVO InterviewAnsread(Long bno); 
	public BoardVO Passlatterread(Long bno); 
	public BoardVO WorryQnAread(Long bno); 
	public BoardVO PassSelfIntroductread(Long bno); 
	
	//게시글 삭제
	public int delete(Long bno);
	
	//게시글 수정
	public int update(BoardVO vo);
	
	public int getTotalCount(Criteria cri);

	

}
