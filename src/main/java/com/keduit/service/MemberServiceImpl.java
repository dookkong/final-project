package com.keduit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduit.domain.MemberVO;
import com.keduit.domain.MemberVO2;
import com.keduit.mapper.BoardMapper;
import com.keduit.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{

	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper member;
	
	@Override
	public void MemberRegister(MemberVO2 vo2) {
		member.insertMember(vo2);
	}

	@Override
	public List<MemberVO> ReadMemberList() {
		return member.getMemberList();
	}

	@Override
	public MemberVO MemberRead(String userid) {
		return member.MemberRead(userid);
	}

	@Override
	public int MemberModify(MemberVO2 vo2) {
		int count=member.MemberUpdate(vo2);
		return count;
	}

	@Override
	public int MemberRemove(String userid) {
		int count=member.MemberDelete(userid);
		return count;
	}
	
	

}
