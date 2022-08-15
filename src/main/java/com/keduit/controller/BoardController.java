package com.keduit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;
import com.keduit.domain.PageDTO;
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
	
	//리스트 불러오기
	@GetMapping("/community1")
	public void community1(Model model) {
		log.info("community1...............");
	}
	
	@GetMapping("/community2")
	public void community2(Model model) {
		log.info("community2...............");
	}
	
	@GetMapping("/community3")
	public void community3(Criteria cri, Model model) {
		log.info("community3...............");
		log.info(cri);
		
		model.addAttribute("list",service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@GetMapping("/community4")
	public void community4(Criteria cri, Model model) {
		log.info("community4...............");
		log.info(cri);
		
		model.addAttribute("list",service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@GetMapping("/login")
	public void login(Model model) {
		log.info("login...............");
	}
	
	@GetMapping("/mypage")
	public void mypage(Model model) {
		log.info("mypage...............");
	}
	
	//새 글 작성 내용 담기
	@GetMapping({"/reg3", "/reg"})
	public void reg() {
		log.info("reg...............");
	}
	
	//새 글 작성한 내용 날리기 커뮤니티3
	@PostMapping("/reg3")
	 public String register(BoardVO vo, RedirectAttributes rttr) {
		log.info("reg...............");
	  
		Long bno = service.register(vo);
	 
		rttr.addFlashAttribute("result",vo.getBno());
	 
		return "redirect:/board/community3";
	 }
	
	//새 글 작성한 내용 날리기 커뮤니티4
	@PostMapping("/reg")
	public String register4(BoardVO vo, RedirectAttributes rttr) {
		log.info("reg...............");
	  
		Long bno = service.register(vo);
	 
		rttr.addFlashAttribute("result",vo.getBno());
	 
		return "redirect:/board/community4";
	 }
	
	//1건 조회하기
	@GetMapping({"/reg-detail3", "/modify3", "/reg-detail", "/modify"})
	public void regdetail(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get..."+bno);
		log.info("reg-detail...............");
		model.addAttribute("board", service.get(bno));
	}
	
	@GetMapping("/sign")
	public void sign(Model model) {
		log.info("sign...............");
	}
	 
	 //1건 수정하기
	 @PostMapping("/modify3") 
	 public String modify(@RequestParam("bno") Long bno, BoardVO vo, 
			 @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
	 
		 int count = service.modify(vo);
	  
		 //1건 수정이 정상적으로 작동 되었을 경우
		 if(count == 1) {
			 rttr.addFlashAttribute("result","success");
		 }
	 
		 return "redirect:/board/reg-detail3?bno=" + bno+"&"+cri.getLinkList();
	 }
	 
	 //1건 수정하기 (커뮤니티 4)
	 @PostMapping("/modify") 
	 public String modify4(@RequestParam("bno") Long bno, BoardVO vo, 
			 @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
	 
		 int count = service.modify(vo);
	  
		 //1건 수정이 정상적으로 작동 되었을 경우
		 if(count == 1) {
			 rttr.addFlashAttribute("result","success");
		 }
	 
		 return "redirect:/board/reg-detail?bno=" + bno+"&"+cri.getLinkList();
	 }
	 
	
	//1건 삭제하기
	 @PostMapping("/remove3") 
	 public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,
			 RedirectAttributes rttr) {
		 
		 int count = service.remove(bno);
	  
		 //1건 삭제가 정상적으로 작동 되었을 경우
		 if(count == 1) {
			 rttr.addFlashAttribute("result","success");
		 }
	 
		 return "redirect:/board/community3";
	 }
	 
	 @PostMapping("/remove") 
	 public String remove4(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,
			 RedirectAttributes rttr) {
	  
		 int count = service.remove(bno);
	  
		 //1건 삭제가 정상적으로 작동 되었을 경우
		 if(count == 1) {
			 rttr.addFlashAttribute("result","success");
		 }
		 
		 return "redirect:/board/community4";
	 }
	 
}
