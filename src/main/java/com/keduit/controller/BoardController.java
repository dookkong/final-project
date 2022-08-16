package com.keduit.controller;

import java.util.List;

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
	public void index(Criteria cri, Model model) {
		cri.setAmount(10);
		model.addAttribute("CompanyVal",service.CompanyValViewsList(cri));
		model.addAttribute("InterviewAns",service.InterviewAnsViewsList(cri));
	}
	
	@GetMapping("/login")
	public void login(Model model) {
	}
	
	@GetMapping("/sign")
	public void sign(Model model) {
	}
	
	@GetMapping("/mypage")
	public void mypage(Model model) {
	}
	
	
	//--------------------리스트 불러오기-------------------------------
	@GetMapping("/community1")
	public void community1(Criteria cri, Model model) {
		BoardVO vo = null;
		vo.getViewlist();
		model.addAttribute("CompanyVal",service.CompanyValList(cri));
		model.addAttribute("Views",service.Views(cri));
		int total = service.CompanyValTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@PostMapping("/community1")
	public void community12(Criteria cri, Model model) {
		model.addAttribute("Views",service.Views(cri));
		int total = service.CompanyValTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@GetMapping("/community2")
	public void community2(Criteria cri, Model model) {
		model.addAttribute("InterviewAns",service.InterviewAnsList(cri));
		int total = service.InterviewAnsTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@GetMapping("/community3")
	public void community3(Criteria cri, Model model) {
		model.addAttribute("Passlatter",service.PasslatterList(cri));
		int total = service.PasslatterTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@GetMapping("/community4")
	public void community4(Criteria cri, Model model) {
		model.addAttribute("WorryQnA",service.WorryQnAList(cri));
		int total = service.WorryQnATotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@GetMapping("/community5")
	public void community5(Criteria cri, Model model) {
		model.addAttribute("PassSelfIntroduct",service.PassSelfIntroductList(cri));
		int total = service.PassSelfIntroductTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	

	//--------------------게시글 상세화면 1건 조회하기-------------------------------	
	@GetMapping({"/reg-detail1", "/modify1"})
	public void CompanyValregdetail(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("reg-detail1..."+bno);
		model.addAttribute("board", service.CompanyValget(bno));
	}
	
	@GetMapping({"/reg-detail2", "/modify2"})
	public void InterviewAnsregdetail(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("reg-detail2..."+bno);
		model.addAttribute("board", service.InterviewAnsget(bno));
	}
	
	@GetMapping({"/reg-detail3", "/modify3"})
	public void Passlatterregdetail(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("reg-detail3..."+bno);
		model.addAttribute("board", service.Passlatterget(bno));
	}
	
	@GetMapping({"/reg-detail4", "/modify4"})
	public void WorryQnAregdetail(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("reg-detail14..."+bno);
		model.addAttribute("board", service.WorryQnAget(bno));
	}
	
	@GetMapping({"/reg-detail5", "/modify5"})
	public void PassSelfIntroductregdetail(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("reg-detail15..."+bno);
		model.addAttribute("board", service.PassSelfIntroductget(bno));
	}

	
	//--------------------게시글 등록화면-------------------------------	
	@GetMapping("/reg1")
	public void CompanyValreg(Model model) {
	}
	@GetMapping("/reg2")
	public void InterviewAnsreg(Model model) {
	}
	@GetMapping("/reg3")
	public void Passlatterreg(Model model) {
	}
	@GetMapping("/reg4")
	public void WorryQnAreg(Model model) {
	}
	@GetMapping("/reg5")
	public void PassSelfIntroductreg(Model model) {
	}

	
	//--------------------게시글 1건 등록하기-------------------------------	
	@PostMapping("/reg1-1")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		log.info("register...............");
		log.info("이거 select 값 --> " + vo.getSelect());
		
		Long bno = service.register(vo);
		
		rttr.addFlashAttribute("result",vo.getBno());
		
		return "redirect:/board/community" + vo.getBno();
	}
	
	@PostMapping("/reg4-1")
	public String WorryQnAregister(BoardVO vo, RedirectAttributes rttr) {
		log.info("WorryQnAregister...............");
		
		Long bno = service.WorryQnAregister(vo);
		
		rttr.addFlashAttribute("result",vo.getBno());
		
		return "redirect:/board/community4";
	}

	
	//--------------------게시글 1건 수정하기-------------------------------	
	 @PostMapping("/modify1") 
	 public String CompanyValmodify(@RequestParam("bno") Long bno, BoardVO vo, RedirectAttributes rttr) { 
	 int count = service.CompanyValmodify(vo);
	  log.info("modify1" + bno);
	 //1건 수정이 정상적으로 작동 되었을 경우
	 if(count == 1) {
		 rttr.addFlashAttribute("result","success");
		 }
	 
	 return "redirect:/board/reg-detail1?bno=" + bno;
	 }
	 
	 @PostMapping("/modify2") 
	 public String InterviewAnsmodify(@RequestParam("bno") Long bno, BoardVO vo, RedirectAttributes rttr) { 
		 int count = service.InterviewAnsmodify(vo);
		 log.info("modify2" + bno);
		 //1건 수정이 정상적으로 작동 되었을 경우
		 if(count == 1) {
			 rttr.addFlashAttribute("result","success");
		 }
		 
		 return "redirect:/board/reg-detail2?bno=" + bno;
	 }
	 
	 @PostMapping("/modify3") 
	 public String Passlattermodify(@RequestParam("bno") Long bno, BoardVO vo, RedirectAttributes rttr) { 
		 int count = service.Passlattermodify(vo);
		 log.info("modify3" + bno);
		 //1건 수정이 정상적으로 작동 되었을 경우
		 if(count == 1) {
			 rttr.addFlashAttribute("result","success");
		 }
		 
		 return "redirect:/board/reg-detail3?bno=" + bno;
	 }
	 
	 @PostMapping("/modify4") 
	 public String WorryQnAmodify(@RequestParam("bno") Long bno, BoardVO vo, RedirectAttributes rttr) { 
		 int count = service.WorryQnAmodify(vo);
		 log.info("modify4" + bno);
		 //1건 수정이 정상적으로 작동 되었을 경우
		 if(count == 1) {
			 rttr.addFlashAttribute("result","success");
		 }
		 
		 return "redirect:/board/reg-detail4?bno=" + bno;
	 }
	 
	 @PostMapping("/modify5") 
	 public String PassSelfIntroductmodify(@RequestParam("bno") Long bno, BoardVO vo, RedirectAttributes rttr) { 
		 int count = service.PassSelfIntroductmodify(vo);
		 log.info("modify5" + bno);
		 //1건 수정이 정상적으로 작동 되었을 경우
		 if(count == 1) {
			 rttr.addFlashAttribute("result","success");
		 }
		 
		 return "redirect:/board/reg-detail5?bno=" + bno;
	 }
	 
	
	//1건 삭제하기
	 @PostMapping("/remove1") 
	 public String CompanyValremove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		 log.info("remove" + bno);
	 int count = service.CompanyValremove(bno);
	  
	 //1건 삭제가 정상적으로 작동 되었을 경우 if(count == 1) {
	 rttr.addFlashAttribute("result","success");
	  
	 return "redirect:/board/community1";
	 }

	 @PostMapping("/remove2") 
	 public String InterviewAnsremove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		 log.info("remove" + bno);
		 int count = service.InterviewAnsremove(bno);
		 
		 //1건 삭제가 정상적으로 작동 되었을 경우 if(count == 1) {
		 rttr.addFlashAttribute("result","success");
		 
		 return "redirect:/board/community2";
	 }

	 @PostMapping("/remove3") 
	 public String Passlatterremove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		 log.info("remove" + bno);
		 int count = service.Passlatterremove(bno);
		 
		 //1건 삭제가 정상적으로 작동 되었을 경우 if(count == 1) {
		 rttr.addFlashAttribute("result","success");
		 
		 return "redirect:/board/community3";
	 }

	 @PostMapping("/remove4") 
	 public String WorryQnAremove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		 log.info("remove" + bno);
		 int count = service.WorryQnAremove(bno);
		 
		 //1건 삭제가 정상적으로 작동 되었을 경우 if(count == 1) {
		 rttr.addFlashAttribute("result","success");
		 
		 return "redirect:/board/community4";
	 }
	 
	 @PostMapping("/remove5") 
	 public String PassSelfIntroductremove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		 log.info("remove" + bno);
		 int count = service.PassSelfIntroductremove(bno);
		 
		 //1건 삭제가 정상적으로 작동 되었을 경우 if(count == 1) {
		 rttr.addFlashAttribute("result","success");
		 
		 return "redirect:/board/community5";
	 }
}