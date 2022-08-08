package com.keduit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keduit.domain.BoardVO;
import com.keduit.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	
	private final BoardService service;
	
	@GetMapping("/index")
	public void index(Model model) {
		log.info("list...........");
	}
	
	@GetMapping("/community1")
	public void community1(Model model) {
		log.info("community1...............");
		model.addAttribute("list",service.getlist());
	}
	
	@GetMapping("/community2")
	public void community2(Model model) {
		log.info("community2...............");
	}
	
	@GetMapping("/community3")
	public void community3(Model model) {
		log.info("community3...............");
	}
	
	@GetMapping("/community4")
	public void community4(Model model) {
		log.info("community4...............");
	}
	
	@GetMapping("/login")
	public void login(Model model) {
		log.info("login...............");
	}
	
	@GetMapping("/mypage")
	public void mypage(Model model) {
		log.info("mypage...............");
	}
	
	@GetMapping("/reg")
	public void reg(Model model) {
		log.info("reg...............");
	}
	
	@GetMapping("/reg-detail")
	public void regdetail(Model model) {
		log.info("reg-detail...............");
	}
	
	@GetMapping("/sign")
	public void sign(Model model) {
		log.info("sign...............");
	}
	
	//리스트 불러오기
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list.............");
		
		model.addAttribute("list",service.getlist());
	}
	
	//1건 조회하기
	 @GetMapping({"/get", "/modify"}) public void get(@RequestParam("bno") Long bno, 
			 Model model) { 
		 model.addAttribute("Board", service.get(bno));
	 }
	 
	
	//새 글 작성 내용 담기
	 @GetMapping("/register") public void registerGet() {
	 
	 }
	
	 
	//새 글 작성한 내용 날리기
	@PostMapping("/register")
	 public String register(BoardVO vo, RedirectAttributes rttr) {
	 log.info("register..........");
	  
	 Long bno = service.register(vo);
	 
	 rttr.addFlashAttribute("result",vo.getBno());
	 
	 return "redirect:/board/list";
	 }
	 
	
	//1건 수정하기
	 @PostMapping("/modify") public String modify(BoardVO vo, RedirectAttributes rttr) {
	 
	 int count = service.modify(vo);
	  
	 //1건 수정이 정상적으로 작동 되었을 경우
	 if(count == 1) {
	 rttr.addFlashAttribute("result","수정 성공");
	 }
	 
	 return "redirect:/board/list";
	 }
	 
	
	//1건 삭제하기
	 @PostMapping("/remove") public String remove(@RequestParam("bno") Long bno, 
			 RedirectAttributes rttr) {
	  
	 int count = service.remove(bno);
	  
	 //1건 삭제가 정상적으로 작동 되었을 경우 if(count == 1) {
	 rttr.addFlashAttribute("result","삭제 성공");
	  
	 return "redirect:/board1/list";
	 }
	 
}
