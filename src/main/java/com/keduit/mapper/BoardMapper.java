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
	public void WorryQnAinsert(BoardVO vo);
	
	//게시글 조회 (키 값(bno)를 이용하여 read)
	public BoardVO CompanyValread(Long bno); 
	public BoardVO InterviewAnsread(Long bno); 
	public BoardVO Passlatterread(Long bno); 
	public BoardVO WorryQnAread(Long bno); 
	public BoardVO PassSelfIntroductread(Long bno); 
	
	//게시글 삭제
	public int CompanyValdelete(Long bno);
	public int InterviewAnsdelete(Long bno);
	public int Passlatterdelete(Long bno);
	public int WorryQnAdelete(Long bno);
	public int PassSelfIntroductdelete(Long bno);
	
	//게시글 수정
	public int CompanyValupdate(BoardVO vo);
	public int InterviewAnsupdate(BoardVO vo);
	public int Passlatterupdate(BoardVO vo);
	public int WorryQnAupdate(BoardVO vo);
	public int PassSelfIntroductupdate(BoardVO vo);
	
	//파라미터를 받아서 페이징처리 sql 처리 메소드
	public List<BoardVO> getListWithPaging(Criteria cri);
		
	//Criteria 내부의 검색 조건을 이용하여 데이터를 뿌려주기 위해 파라미터로 받는다.
	public int CompanyValTotalCount(Criteria cri);
	public int InterviewAnsTotalCount(Criteria cri);
	public int PasslatterTotalCount(Criteria cri);
	public int WorryQnATotalCount(Criteria cri);
	public int PassSelfIntroductTotalCount(Criteria cri);

	//좋아요수에 따른 list
	public List<BoardVO> CompanyValViewsList(Criteria cri);
	public List<BoardVO> CompanyValViewsPaging(Criteria cri);
	public List<BoardVO> InterviewAnsViewsList(Criteria cri);
	public List<BoardVO> InterviewAnsViewsPaging(Criteria cri);

	public List<BoardVO> Views(Criteria cri);
	
}
