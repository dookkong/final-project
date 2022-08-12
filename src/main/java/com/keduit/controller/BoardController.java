package com.keduit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	}
	
	@GetMapping("/community1")
	public void community1(Criteria cri, Model model) {
		model.addAttribute("CompanyVal",service.CompanyValList(cri));
		 int total = service.getTotalCount(cri);
	      log.info("total : " + total);
	      
	      model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	
	@GetMapping("/community2")
	public void community2(Criteria cri, Model model) {
		model.addAttribute("InterviewAns",service.InterviewAnsList(cri));
		 int total = service.getTotalCount(cri);
	      log.info("total : " + total);
	      
	      model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	
	@GetMapping("/community3")
	public void community3(Criteria cri, Model model) {
		model.addAttribute("Passlatter",service.PasslatterList(cri));
		 int total = service.getTotalCount(cri);
	      log.info("total : " + total);
	      
	      model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	
	@GetMapping("/community4")
	public void community4(Criteria cri, Model model) {
		model.addAttribute("WorryQnA",service.WorryQnAList(cri));
		 int total = service.getTotalCount(cri);
	      log.info("total : " + total);
	      
	      model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	@GetMapping("/community5")
	public void community5(Criteria cri, Model model) {
		model.addAttribute("PassSelfIntroduct",service.PassSelfIntroductList(cri));
		int total = service.getTotalCount(cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	
	@GetMapping("/login")
	public void login(Model model) {
	}
	
	@GetMapping("/mypage")
	public void mypage(Model model) {
	}
	
	@GetMapping("/reg")
	public void reg() {
	}
	@GetMapping("/reg2")
	public void reg2() {
	}
	
	@PostMapping("/reg")
	 public String reg(BoardVO vo, RedirectAttributes rttr) {
	  
	 Long bno = service.register(vo);
	 
	 rttr.addFlashAttribute("result",vo.getBno());
	 
	 return "redirect:/board/list";
	 }
	
	@GetMapping("/reg-detail1")
	public void regdetail(@RequestParam("bno") Long bno, Model model) {
		model.addAttribute("board", service.CompanyValget(bno));
	}
	
	@GetMapping("/reg-detail2")
	public void regdetail2(@RequestParam("bno") Long bno, Model model) {
		model.addAttribute("board", service.InterviewAnsget(bno));
	}
	
	@GetMapping("/reg-detail3")
	public void regdetail3(@RequestParam("bno") Long bno, Model model) {
		model.addAttribute("board", service.Passlatterget(bno));
	}
	
	@GetMapping("/reg-detail4")
	public void regdetail4(@RequestParam("bno") Long bno, Model model) {
		model.addAttribute("board", service.WorryQnAget(bno));
	}
	
	@GetMapping("/reg-detail5")
	public void regdetail5(@RequestParam("bno") Long bno, Model model) {
		model.addAttribute("board", service.PassSelfIntroductget(bno));
	}
	
	@GetMapping("/sign")
	public void sign(Model model) {
	}
	
	@GetMapping("/management")
	public void management(Model model) {
		model.addAttribute("management",service.management());
	}
	
	@GetMapping("/member-detail")
	public void memberdetail(Model model) {
		model.addAttribute("memberdetail",service.memberdetail());
	}
	
	@GetMapping("/modify1")
	public void modify1(Model model) {
	}
	
	@GetMapping("/modify2")
	public void modify2(Model model) {
	}
	
	@GetMapping("/modify3")
	public void modify3(Model model) {
	}
	
	@GetMapping("/modify4")
	public void modify4(Model model) {
	}
	
	@GetMapping("/modify5")
	public void modify5(Model model) {
	}

	
	
	
	
	
	
//	//1건 조회하기
//	 @GetMapping({"/get", "/modify"}) public void get(@RequestParam("bno") Long bno, 
//			 Model model) { 
//		 model.addAttribute("Board", service.get(bno));
//	 }
	 
	
	//새 글 작성 내용 담기
	 @GetMapping("/register") 
	 public void registerGet() {
	 
	 }
	
	 
	//새 글 작성한 내용 날리기
	@PostMapping("/register")
	 public String register(BoardVO vo, RedirectAttributes rttr) {
	 log.info("register..........");
	  
	 Long bno = service.register(vo);
	 
	 rttr.addFlashAttribute("result",vo.getBno());
	 
	 return "redirect:/board/list";
	 }
	 
	
//	//1건 수정하기
//	 @PostMapping("/modify") public String modify(BoardVO vo, RedirectAttributes rttr) {
//	 
//	 int count = service.modify(vo);
//	  
//	 //1건 수정이 정상적으로 작동 되었을 경우
//	 if(count == 1) {
//	 rttr.addFlashAttribute("result","수정 성공");
//	 }
//	 
//	 return "redirect:/board/list";
//	 }
	 
	
	//1건 삭제하기
	 @PostMapping("/remove") public String remove(@RequestParam("bno") Long bno, 
			 RedirectAttributes rttr) {
	  
	 int count = service.remove(bno);
	  
	 //1건 삭제가 정상적으로 작동 되었을 경우 if(count == 1) {
	 rttr.addFlashAttribute("result","삭제 성공");
	  
	 return "redirect:/board1/list";
	 }
	 
}
