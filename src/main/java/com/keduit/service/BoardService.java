package com.keduit.service;

import java.util.List;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;
import com.keduit.domain.MemberVO;

public interface BoardService {
	//새 글 작성
	public Long register(BoardVO vo);
	
	//1건 조회 (상세보기)
	public BoardVO CompanyValget(Long bno);
	public BoardVO InterviewAnsget(Long bno);
	public BoardVO Passlatterget(Long bno);
	public BoardVO WorryQnAget(Long bno);
	public BoardVO PassSelfIntroductget(Long bno);
	
	//페이지 관련
	public List<BoardVO> CompanyValList(Criteria cri);
	public List<BoardVO> InterviewAnsList(Criteria cri);
	public List<BoardVO> PasslatterList(Criteria cri);
	public List<BoardVO> WorryQnAList(Criteria cri);
	public List<BoardVO> PassSelfIntroductList(Criteria cri);
	
	//1건 수정하기
	public int modify(BoardVO vo);
	
	//1건 삭제하기
	public int remove(Long bno);
	
	public int getTotalCount(Criteria cri);
	
	//list 불러오기

	public List<MemberVO> management();

	public List<MemberVO> memberdetail();


}
