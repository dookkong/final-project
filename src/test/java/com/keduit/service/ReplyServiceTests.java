package com.keduit.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keduit.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTests {
	
	@Setter(onMethod_=@Autowired)
	private ReplyService service;
	
	@Test
	public void testRegister() {
		ReplyVO vo = new ReplyVO();
		
		log.info("insert...............");
		
		vo.setRno(3L);
		vo.setBno(526L);
		vo.setReply("댓글이다!!");
		vo.setUserid("nana");
		
		service.register(vo);
	}
	
	@Test
	public void testGet() {
		
		log.info("get............");
		
		service.get(4L);
	}
	
	@Test
	public void testModify() {
		ReplyVO vo = new ReplyVO();
		
		log.info("modify.........");
		
		vo.setRno(5L);
		vo.setReply("댓글 수정합니다요");
		
		service.modify(vo);
	}
	
	@Test
	public void testRemove() {
		log.info("remove.........");
		
		int count = service.remove(10L);
		
		log.info(count);
	}
}
