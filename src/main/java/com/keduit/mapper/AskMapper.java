package com.keduit.mapper;

import java.util.List;

import com.keduit.domain.AskVO;
import com.keduit.domain.MemberVO;

public interface AskMapper {

	public void insertAsk(AskVO vo);
	
	public List<AskVO> getAskList(String userid);
	
}
