package com.keduit.service;

import java.util.List;

import com.keduit.domain.MemberVO;
import com.keduit.domain.MemberVO2;

public interface MemberService {
	
	public void MemberRegister(MemberVO2 vo2);
	
	public List<MemberVO> ReadMemberList();
	
	public MemberVO MemberRead(String userid);
	
	public int MemberModify(MemberVO2 vo2);
	
	public int MemberRemove(String userid);

}
