package com.keduit.mapper;

import java.util.List;
import com.keduit.domain.MemberVO;

public interface MemberMapper {

	public List<MemberVO> management();

	public List<MemberVO> memberdetail();
}
