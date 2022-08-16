package com.keduit.service;

import java.util.List;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;
import com.keduit.domain.MemberVO;

public interface BoardService {
	//새 글 작성
	public Long register(BoardVO vo);
	public Long WorryQnAregister(BoardVO vo);
	
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
	public int CompanyValmodify(BoardVO vo);
	public int InterviewAnsmodify(BoardVO vo);
	public int Passlattermodify(BoardVO vo);
	public int WorryQnAmodify(BoardVO vo);
	public int PassSelfIntroductmodify(BoardVO vo);
	
	//1건 삭제하기
	public int CompanyValremove(Long bno);
	public int InterviewAnsremove(Long bno);
	public int Passlatterremove(Long bno);
	public int WorryQnAremove(Long bno);
	public int PassSelfIntroductremove(Long bno);
	
	//페이징처리 메서드
	public List<BoardVO> getList(Criteria cri);

	//검색한 데이터 불러오기
	public int CompanyValTotal(Criteria cri);
	public int InterviewAnsTotal(Criteria cri);
	public int PasslatterTotal(Criteria cri);
	public int WorryQnATotal(Criteria cri);
	public int PassSelfIntroductTotal(Criteria cri);
	
	//memberlist 불러오기
	public List<MemberVO> management();

	public List<MemberVO> memberdetail();

	//좋아요수에 따른 list
	public List<BoardVO> CompanyValViewsList(Criteria cri);
	public List<BoardVO> InterviewAnsViewsList(Criteria cri);
	
	public List<BoardVO> Views(Criteria cri);
}
