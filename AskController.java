package com.keduit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keduit.domain.AskVO;
import com.keduit.service.AskService;
import com.keduit.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/board/*")
public class AskController {
	
	private final AskService service;
	
	@GetMapping("/AskReg")
	public void GetAskReg() {
		log.info("Get방식 AskReg...............");
	}
	
	@PostMapping("/AskReg")
	public void PostAskReg(AskVO vo,HttpServletRequest request) {
		log.info("Post방식 AskReg...............");
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		vo.setCategory(request.getParameter("select"));
		vo.setUserid(request.getParameter("userid"));
		service.AskRegister(vo);
	}
	
	@GetMapping("/mypage")
	public void GetMypage(String userid,Model model) {
		log.info("Get방식 Mypage...............");
		model.addAttribute("list",service.AskList(userid));
		log.info("끝...............");
	}
	
	
	


}
