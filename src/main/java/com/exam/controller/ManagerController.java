package com.exam.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.exam.dto.MemberDTO;
import com.exam.service.ManagerService;

@Controller
public class ManagerController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	ManagerService managerService;
	
	public ManagerController(ManagerService managerService) {
		this.managerService = managerService;
	}

	@GetMapping(value={"/memberList"})
	public String showMemberListPage(ModelMap model) {
		
		List<MemberDTO> memberList = managerService.memberList();
		model.addAttribute("memberList", memberList);
		return "memberList";
	}
	
	@PostMapping(value={"/editMember"})
	public String showEditMemberPage(ModelMap model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDTO xxx = (MemberDTO)auth.getPrincipal();
		return "redirect:home";
	}
	
	
}















