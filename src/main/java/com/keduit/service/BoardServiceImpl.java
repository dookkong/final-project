package com.keduit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduit.domain.BoardVO;
import com.keduit.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	//새 글 작성
	public Long register(BoardVO vo) {
		
		mapper.insert(vo);
		
		return vo.getBno();
	}

	@Override
	//1건 조회 (글 상세보기)
	public BoardVO get(Long bno) {
		
		return mapper.read(bno);
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
	//list 불러오기
	public List<BoardVO> getlist() {
		
		return mapper.getlist();
	}
}
