package com.keduit.service;

import java.util.List;

import com.keduit.domain.AskVO;
import com.keduit.domain.MemberVO;

public interface AskService {
	
	public void AskRegister(AskVO vo);
	
	public List<AskVO> AskList(String userid);


}
