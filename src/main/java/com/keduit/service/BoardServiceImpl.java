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

	@Override
	//새 글 작성
	public Long register(BoardVO vo) {
		
		mapper.insert(vo);
		
		return vo.getBno();
	}

	//1건 조회 (글 상세보기)
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

	@Override
	//1건 수정하기
	public int modify(BoardVO vo) {

		return mapper.update(vo);
	}

	@Override
	//1건 삭제하기
	public int remove(Long bno) {
		
		return mapper.delete(bno);
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
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	
 // 각 게시판 불러오는 부분
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


}
