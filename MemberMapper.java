package com.keduit.mapper;

import java.util.List;

import com.keduit.domain.AuthVO;
import com.keduit.domain.MemberVO;
import com.keduit.domain.MemberVO2;

public interface MemberMapper {

	public MemberVO read(String userid);
	
	public void insertMember(MemberVO2 vo2);
	
	public List<MemberVO> getMemberList();
	
	public MemberVO MemberRead(String userid);
	
	public int MemberUpdate (MemberVO2 vo2);
	
	public int MemberDelete(String userid);
	
}
