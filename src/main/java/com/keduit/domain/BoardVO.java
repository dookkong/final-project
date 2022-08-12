package com.keduit.domain;

import java.sql.Date;


import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title, content, userid, views, likes;
	private Date regdate, updatedate;
}
