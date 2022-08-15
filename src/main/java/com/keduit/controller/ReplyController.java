package com.keduit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyPageDTO;
import com.keduit.domain.ReplyVO;
import com.keduit.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController //@Controller에 @ResponseBody가 추가 된 것
//json 형태로 객체를 반환한다. / 객체를 ResponseEntity로 감싸서 반환한다.
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	@Setter(onMethod_=@Autowired)
	private ReplyService service;
	
	//댓글 작성
	@PostMapping(value = "/creat",
			consumes = "application/json", //application/json 타입의 request만 받도록 지정 
			produces = {MediaType.TEXT_PLAIN_VALUE}) //response 타입이 text 타입일 경우에 return
	//ResponseEntity<T> : HttpEntity<T>클래스를 상속 받고 있는 응답독립체
	//StatusField를 가지고 있기 때문에 상태코드는 필수적으로 포함해줘야 한다.
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		//@RequestBody : 데이터를 반환하기 위해 사용
		log.info("create.........."+vo);
		int insertCount = service.register(vo);
		log.info("댓글 입력 count => "+insertCount);
		
		//insertCount == 1은 댓글 1줄이 등록 되었다는 뜻
		//댓글이 등록 되면
		return insertCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK) // insertCount == 1
			   :new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR); //insertCount != 1
		//INTERNAL_SERVER_ERROR : 내부적 오류가 있을 때 발생하는 응답코드, Application이나 서버 내부의 문제
	}
	
	//댓글 페이지에 따른 목록
	@GetMapping(value = "/pages/{bno}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_VALUE}) //response타입이 xml, json 타입일 경우에 return
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page,
												@PathVariable("bno") Long bno){
		//@PathVariable() : url의 경로에 변수를 넣어준다.
		//@RequestMapping 어노테이션 값으로 {템플릿 변수}를 사용,
		//@PathVariable 어노테이션을 사용하여 {템플릿 변수}와 동일한 이름을 갖는 파라미터 추가
		
		log.info("reply getlist............."+page+","+bno);
		
		Criteria cri = new Criteria(page, 20);
		log.info(cri);
		
		return new ResponseEntity<ReplyPageDTO>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	
	//댓글 1개 가져오기
	@GetMapping(value ="/{rno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno){
		
		log.info("reply get............"+rno);
		
		return new ResponseEntity<ReplyVO>(service.get(rno), HttpStatus.OK);
	}
	
	//댓글 1건 삭제
	//@DeleteMapping : Delete를 위한 Http(s)요청 처리 어노테이션
	//기존의 정보를 삭제할 때 주로 사용한다.
	//@DeleteMapping(value ="/{rno}" => rno 값으로 정보 삭제
	@DeleteMapping(value ="/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		
		log.info("remove............"+rno);
		
		int removeCount = service.remove(rno);
		return removeCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK)
			   :new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 1건 수정
	//기존의 정보를 수정하는 것이므로 RequestMapping으로 사용 (put, patch)
	//PutMapping : 기존의 정보를 수정
	//PatchMapping : 일부 정보를 수정
	@RequestMapping(value ="/{rno}",
			method = {RequestMethod.PUT, RequestMethod.PATCH},
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo,
			@PathVariable("rno") Long rno){
		
		vo.setRno(rno);
		
		log.info("modify......."+rno);
		log.info("modify........"+vo);
		
		int modifyCount = service.modify(vo);
		
		log.info("modifyCount........."+modifyCount);
		
		return modifyCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK)
			   :new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
