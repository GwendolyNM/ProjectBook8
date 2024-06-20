package com.exam.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.dto.MemberDTO;
import com.exam.service.ManagerService;
import com.exam.service.MemberService;

@Controller
public class ManagerController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	ManagerService managerService;
	
	public ManagerController(ManagerService managerService) {
		this.managerService = managerService;
	}
	
	@GetMapping(value={"/memberList"})
	public String showMemberList(ModelMap m){
		
		List<MemberDTO> memberList = managerService.memberList();
		m.addAttribute("memberList",memberList);
		return "memberList";
	}
	
	@GetMapping("/idCheck2")
	public @ResponseBody String signup(@RequestParam String userid) {//$.ajax key값을 가지고 와야한다 기억! 

		MemberDTO dto = managerService.idCheck2(userid);
		logger.info("userid={}", userid);
		
		
		String mesg = "사용가능";
		if(dto != null) {
			mesg = "사용불가";
		}
		
		return mesg;
	}
	
	@PostMapping(value={"/editMember"})
	public String editMember(@Valid MemberDTO member, 
			BindingResult result, ModelMap m) {
	
		List<MemberDTO> memberList = managerService.memberList();
		m.addAttribute("memberList",memberList);
		if(result.hasErrors()) {
			return "editMember";
		}
		
		memberList = managerService.editMember();
		return "redirect:home";
	}
}
