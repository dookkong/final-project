package com.keduit.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keduit.domain.MemberVO2;
import com.keduit.service.AskService;
import com.keduit.service.BoardService;
import com.keduit.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/board/*")
public class MemberController {
	
	private final MemberService service;
	private final PasswordEncoder pwencoder;
	private final AskService askService;
	
	@GetMapping("/sign")
	public void GetSign() {
		log.info("Get 방식 sign...............");
	}
	
	
	@PostMapping("/sign")
	public String PostSign(MemberVO2 vo2,RedirectAttributes rttr) {
		log.info("Post 방식 sign...............");
		log.info("바뀌기전:"+vo2);
		vo2.setUserpw(pwencoder.encode(vo2.getUserpw()));
		log.info("바뀌고난후:"+vo2);
		service.MemberRegister(vo2);
		
		return "redirect:/board/index";
	}
	
	@GetMapping("/management")
	public void GetManagement(Model model) {
		log.info("Get방식 Management...............");
		model.addAttribute("list",service.ReadMemberList());
	}
	
	@GetMapping("/member-detail")
	public void GetMemberDetail(String userid, Model model) {
		log.info("Get방식 MemberDetail...............");
		model.addAttribute("member", service.MemberRead(userid));
	}

	
	@PostMapping("/memberModify")
	public String PostMemberModify(MemberVO2 vo2,RedirectAttributes rttr) {
		log.info("Post 방식 MemberModify...............");
		int count=service.MemberModify(vo2);
		log.info("수정건수: "+count);
		return "redirect:/board/management";
	}
	
	@PostMapping("/memberRemove")
	public String PostMemberRemove(String userid, Model model) {
		log.info("Post 방식 MemberRemove...............");
		int count=service.MemberRemove(userid);
		log.info("삭제건수: "+count);
		return "redirect:/board/management";
	}
	


}
