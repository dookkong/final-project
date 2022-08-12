package com.keduit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rno;
	private Long bno;
	
	private String reply;
	private String userid;
	private Date regdate;
	private Date updatedate;
}
