package com.keduit.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	//TEST할 BNO들의 배열
	private Long[] bnoArr = {100L, 50L, 250L, 526L}; 
	
	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testInsert() {
		IntStream.rangeClosed(1, 5).forEach(i ->{
			ReplyVO vo = new ReplyVO();
			
			vo.setBno(bnoArr[3]);
			vo.setReply("댓글 테스트");
			vo.setUserid("nana");
			
			mapper.insert(vo);
		});
	}
	
	@Test
	public void testRead() {
		Long rno = 3L;
		
		ReplyVO vo = mapper.read(rno);
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		Long rno = 3L;
		
		int result = mapper.delete(rno);
		
		log.info("삭제 결과 : "+result);
	}
	
	@Test
	//댓글 업데이트는 댓글을 먼저 읽은 후 업데이트 해야 한다?
	public void testUpdate() {
		ReplyVO vo = new ReplyVO();
		
		vo.setRno(5L);
		vo.setReply("댓글!!!");
		
		mapper.update(vo);
		
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[3]);
		replies.forEach(reply -> log.info(reply));
	}
	
}
