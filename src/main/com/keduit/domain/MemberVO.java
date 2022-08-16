package com.keduit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private Long bno;
	private String username;
	private String password;
	private String userid;
	private String userphone;
	private Date regdate;
	private Date updatedate;
	private String auth;
}
