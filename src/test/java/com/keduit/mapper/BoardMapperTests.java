package com.keduit.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keduit.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testgetList() {
		log.info("get list.................");
		mapper.getlist();
	}
	
	@Test
	public void testinsert() {
		BoardVO vo = new BoardVO();
		
		log.info("insert............");
		
		vo.setTitle("제목1");
		vo.setContent("내용1");
		vo.setUserid("user01");
		
		mapper.insert(vo);
	}
	
	@Test
	public void testRead() {
		//BoardMapper.xml에서 쿼리를 통해 가져온 값을 BoardVO에 넣어주기
		BoardVO vo = mapper.read(9L);
		
		log.info("read.................");		
	}
	
	@Test
	public void testDelete() {
		
		log.info("delete.................");
		int count = mapper.delete(10L);
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = new BoardVO();
		
		log.info("update............");
		
		vo.setBno(5L);
		vo.setTitle("타이틀02");
		vo.setContent("내용02");
		vo.setUserid("작성자02");
		
		mapper.update(vo);
	}
}
