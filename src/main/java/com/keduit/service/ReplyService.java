package com.keduit.service;

import java.util.List;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyPageDTO;
import com.keduit.domain.ReplyVO;

public interface ReplyService {
	
	//댓글 작성
	public int register(ReplyVO vo);
	
	//특정 댓글 조회
	public ReplyVO get(Long rno);
	
	//댓글 수정하기
	public int modify(ReplyVO vo);
	
	//댓글 삭제하기
	public int remove(Long rno);
	
	//댓글 list 불러오기
	public List<ReplyVO> getlist(Criteria cri, Long bno);
	
	//선택한 페이지에 대한 댓글 목록 (댓글 페이지)
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
}
