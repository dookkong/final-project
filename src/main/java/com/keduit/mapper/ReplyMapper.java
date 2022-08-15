package com.keduit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyVO;

public interface ReplyMapper {
	
	//댓글 등록
	public int insert(ReplyVO vo);
	
	//댓글 1건 확인(특정 게시글에 댓글이 달려있기 때문에 bno로 확인)
	public ReplyVO read(Long bno);
	
	//댓글 삭제
	public int delete(Long rno);
	
	//댓글 수정
	public int update(ReplyVO vo);
	
	//댓글 리스트
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	//특정 게시글에 달린 댓글의 개수
	public int getCountByBno(Long bno);
}
