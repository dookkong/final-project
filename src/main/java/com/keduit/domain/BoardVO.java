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
	private String views;
	private String likes;
	private String category;
	private String select;
	private String viewlist;
	
}
