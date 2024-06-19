package com.exam.controller;


import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.exam.dto.MemberDTO;
import com.exam.service.MemberService;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	MemberService memberService;
	
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	@GetMapping(value={"/signup"})
	public String showSignupPage(ModelMap model) {
		

		model.put("memberDTO", new MemberDTO()); 


		return "memberForm";
	}

	@PostMapping(value={"/signup"})
	public String showSignUpSuccessPage(@Valid MemberDTO member, 
			BindingResult result) {
	
		
		if(result.hasErrors()) {
			return "memberForm";
		}

		String encptPw = 
				new BCryptPasswordEncoder().encode(member.getMember_pw());
		member.setMember_pw(encptPw);
		int n = memberService.save(member);
		return "redirect:home";
	}
	
	@GetMapping(value={"/mypage"})
	public String mypage() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDTO xxx = (MemberDTO)auth.getPrincipal();
		return "redirect:home";
	}
}















