package com.keduit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;
import com.keduit.domain.MemberVO;
import com.keduit.mapper.BoardMapper;
import com.keduit.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper member;

	
	//==========게시글 새 글 작성==========	
	@Override
	public Long register(BoardVO vo) {
		mapper.insert(vo);
		return vo.getBno();
	}
	
	@Override
	public Long WorryQnAregister(BoardVO vo) {
		mapper.WorryQnAinsert(vo);
		return vo.getBno();
	}

	
	//==========1건 조회 get (글 상세보기)==========
	@Override
	public BoardVO CompanyValget(Long bno) {
		return mapper.CompanyValread(bno);
	}
	
	@Override
	public BoardVO InterviewAnsget(Long bno) {
		return mapper.InterviewAnsread(bno);
	}
	
	@Override
	public BoardVO Passlatterget(Long bno) {	
		return mapper.Passlatterread(bno);
	}
	
	@Override
	public BoardVO WorryQnAget(Long bno) {
		return mapper.WorryQnAread(bno);
	}
	
	@Override
	public BoardVO PassSelfIntroductget(Long bno) {
		return mapper.PassSelfIntroductread(bno);
	}

	
	//==========게시판 1건 수정하기==========
	@Override
	public int CompanyValmodify(BoardVO vo) {
		return mapper.CompanyValupdate(vo);
	}
	
	@Override
	public int InterviewAnsmodify(BoardVO vo) {		
		return mapper.InterviewAnsupdate(vo);
	}
	
	@Override
	public int Passlattermodify(BoardVO vo) {	
		return mapper.Passlatterupdate(vo);
	}
	
	@Override
	public int WorryQnAmodify(BoardVO vo) {		
		return mapper.WorryQnAupdate(vo);
	}
	
	@Override
	public int PassSelfIntroductmodify(BoardVO vo) {		
		return mapper.PassSelfIntroductupdate(vo);
	}

	
	//==========게시판 1건 삭제하기==========	
	@Override
	public int CompanyValremove(Long bno) {
		
		return mapper.CompanyValdelete(bno);
	}
	
	@Override
	public int InterviewAnsremove(Long bno) {
		
		return mapper.InterviewAnsdelete(bno);
	}
	
	@Override
	public int Passlatterremove(Long bno) {
		
		return mapper.Passlatterdelete(bno);
	}
	
	@Override
	public int WorryQnAremove(Long bno) {
		
		return mapper.WorryQnAdelete(bno);
	}
	
	@Override
	public int PassSelfIntroductremove(Long bno) {
		
		return mapper.PassSelfIntroductdelete(bno);
	}


	@Override
	public List<MemberVO> management() {
		
		return member.management();
	}
	
	@Override
	public List<MemberVO> memberdetail() {
		
		return member.memberdetail();
	}


	@Override
	public List<BoardVO> getList(Criteria cri) {		
		return mapper.getListWithPaging(cri);
	}
	
	
	//==========페이징 처리하기==========	
	@Override
	public int CompanyValTotal(Criteria cri) {		
		return mapper.CompanyValTotalCount(cri);
	}
	
	@Override
	public int InterviewAnsTotal(Criteria cri) {		
		return mapper.InterviewAnsTotalCount(cri);
	}
	
	@Override
	public int PasslatterTotal(Criteria cri) {	
		return mapper.PasslatterTotalCount(cri);
	}
	
	@Override
	public int WorryQnATotal(Criteria cri) {	
		return mapper.WorryQnATotalCount(cri);
	}
	
	@Override
	public int PassSelfIntroductTotal(Criteria cri) {
		return mapper.PassSelfIntroductTotalCount(cri);
	}
	
	
	// ==========각 게시판list 불러오는 부분==========
	@Override
	public List<BoardVO> CompanyValList(Criteria cri) {	
		return mapper.CompanyValPaging(cri);
	}
	
	@Override
	public List<BoardVO> InterviewAnsList(Criteria cri) {
		return mapper.InterviewAnsPaging(cri);
	}
	
	@Override
	public List<BoardVO> PasslatterList(Criteria cri) {	
		return mapper.PasslatterPaging(cri);
	}
	
	@Override
	public List<BoardVO> WorryQnAList(Criteria cri) {	
		return mapper.WorryQnAPaging(cri);
	}
	
	@Override
	public List<BoardVO> PassSelfIntroductList(Criteria cri) {	
		return mapper.PassSelfIntroductPaging(cri);
	}

	//좋아요수에 따른 list
	@Override
	public List<BoardVO> CompanyValViewsList(Criteria cri) {	
		return mapper.CompanyValViewsPaging(cri);
	}
	
	@Override
	public List<BoardVO> InterviewAnsViewsList(Criteria cri) {	
		return mapper.InterviewAnsViewsPaging(cri);
	}

	@Override
	public List<BoardVO> Views(Criteria cri) {
		return mapper.Views(cri);
	}
}
