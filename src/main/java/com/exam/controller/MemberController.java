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
import org.springframework.web.bind.annotation.ModelAttribute;
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
		MemberDTO mypageInfo = memberService.findMypage(dto.getMember_id());
		logger.info("mypageinfo:{}", mypageInfo);
		logger.info("mypageinfo:{}", dto.getMember_id());
		m.addAttribute("member",mypageInfo);
		return "mypage";
	}

	@PostMapping(value= {"/updateMypage"})
	public String updateMypage(@RequestParam("member_id") String member_id,
			 @RequestParam("member_name") String member_name,
			 @RequestParam("member_phone1") String member_phone1,
			 @RequestParam("member_phone2") String member_phone2,
			 @RequestParam("member_phone3") String member_phone3,
			 @RequestParam("member_addressRoad") String member_addressRoad,
			 @RequestParam("member_addressJibun") String member_addressJibun,
			 @RequestParam("member_addressDetail") String member_addressDetail,
			 @Valid @ModelAttribute("getMember") MemberDTO getMember,
			 BindingResult result) {
		
//		if(result.hasErrors()) {
//			logger.info("logger 입력오류{}", "입력값 확인하세요!");
//			return "redirect:mypage";
//		}
		
		getMember.setMember_id(member_id);
		getMember.setMember_name(member_name);
		getMember.setMember_phone1(member_phone1);
		getMember.setMember_phone2(member_phone2);
		getMember.setMember_phone3(member_phone3);
		getMember.setMember_addressRoad(member_addressRoad);
		getMember.setMember_addressJibun(member_addressJibun);
		getMember.setMember_addressDetail(member_addressDetail);
		
		logger.info("logger memberDTO 수정 적용 후{}", getMember);

//		model.getAttribute(member_idx);
//		(MemberDTO) managerService.getMember(Integer.parseInt(member_idx));
		
		
		memberService.updateMypage(getMember);
		logger.info("logger: updateMypage DB 변경 {}", getMember);

		// 성공 메시지 표시 + 수정이 완료시 회원목록으로 리다이렉트
		logger.info("logger: 수정성공 {}", "수정성공!");
		return "redirect:home";
		//
	}
}















