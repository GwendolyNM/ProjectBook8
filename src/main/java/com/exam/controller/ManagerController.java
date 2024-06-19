package com.exam.controller;

import java.util.List;

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

@Controller
public class ManagerController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	MemberService memberService;
	
	public ManagerController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping(value={"/memberList"})
	public String showMemberPage(@Valid MemberDTO member, 
			BindingResult result) {
		
		if(result.hasErrors()) {
			return "redirect:home";
		}
		List<MemberDTO> memberDTO = memberService.memberList();
			
		return "memberList";
	}
	
	@PostMapping(value={"/editMember"})
	public String editMember(ModelMap m) {
		
			List<MemberDTO> editMember = memberService.memberList();
			m.addAttribute("editMember", editMember);
			
		return "editMember";
	}
}
