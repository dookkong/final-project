package com.keduit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private String userid;
	private Date regdate;
	private Date updatedate;
	private int views;
	private int likes;
}
