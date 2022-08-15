package com.keduit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyPageDTO;
import com.keduit.domain.ReplyVO;
import com.keduit.mapper.BoardMapper;
import com.keduit.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper boardMapper;
	
	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		log.info("댓글 등록! ---------");
		
		return mapper.insert(vo);
	}

	@Override
	//댓글 1건 조회
	public ReplyVO get(Long rno) {
		log.info("댓글 상세 조회! -------");
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("댓글 수정하기! -------");
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		log.info("댓글 삭제하기! -----------");
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getlist(Criteria cri, Long bno) {
		log.info("댓글 목록! ------------");
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		log.info("댓글 목록 페이지 처리!");
		
		return new ReplyPageDTO(mapper.getCountByBno(bno), //해당 bno에 달린 댓글의 개수
								mapper.getListWithPaging(cri, bno)); //해당 페이지의 게시글을 가져와서 보여줌 
	}

}
