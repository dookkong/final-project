package com.keduit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduit.domain.AskVO;
import com.keduit.domain.MemberVO;
import com.keduit.mapper.AskMapper;
import com.keduit.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AskServiceImpl implements AskService{

	@Setter(onMethod_ = @Autowired)
	private AskMapper mapper;
	
	@Override
	public void AskRegister(AskVO vo) {
		mapper.insertAsk(vo);
	}

	@Override
	public List<AskVO> AskList(String userid) {
		return mapper.getAskList(userid);
	}
	
}
