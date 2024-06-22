package com.exam.controller;


import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.dto.MemberDTO;
import com.exam.service.MemberService;

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
	public String showSignUpSuccessPag(Model m,
			@Valid MemberDTO member, BindingResult result) {
		
		if(result.hasErrors()) {
			return "memberForm";
		}

		String encptPw = 
				new BCryptPasswordEncoder().encode(member.getMember_pw());
		member.setMember_pw(encptPw);
		int n = memberService.save(member);
		if(n>0) {
			m.addAttribute("message", "회원가입 성공");
			return "redirect:/home?signupSuccess=true";
		}else {
			m.addAttribute("message", "회원가입 실패");
		return "memberForm";
		}
	}
	

	
	@GetMapping("/idCheck")
	public @ResponseBody String signup(@RequestParam String userid) {//$.ajax key값을 가지고 와야한다 기억! 

		int checkId = memberService.idCheck(userid);
		logger.info("userid={}", userid);
		String mesg;
		if(checkId == 1) {
			mesg = "사용불가";
		}else {
			mesg = "사용가능";
		}
		return mesg;
		
	}
	
	
	@GetMapping(value={"/mypage"}) 
	public String showmypage(ModelMap m) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDTO dto = (MemberDTO)auth.getPrincipal();
		System.out.println("222222");
		MemberDTO mypageInfo = memberService.findMypage(dto.getMember_id());
		System.out.println("111111");
		logger.info("mypageinfo:{}", dto.getMember_id());
		m.addAttribute("member",mypageInfo);
		return "mypage";
	}
	//ss
	@PostMapping(value= {"/mypage"})
	public String Redirectmypage(Model m) {
		
		return "redirect:mypage";
		//
	}
}















