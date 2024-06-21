package com.exam.controller;


import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@PostMapping(value={"/memberList"})
	public String RedirectMemberListPage(@RequestParam("member_idx") String member_idx) {
		return "redirect:memberList";
	}
	
	
    @PostMapping("/editMember")
    public String showEditMemberPage(ModelMap model, @RequestParam("member_idx") 
    						 String member_idx, MemberDTO memberDTO) {
    	
    	//멤버리스트 생성
    	List<MemberDTO> getMember;
    	
    	//member_idx로 DB 회원 정보 가져온다.
    	getMember = managerService.getMember(Integer.parseInt(member_idx));
    	logger.info("logger: member_idx 회원번호 가져오기: {}", member_idx);
    	logger.info("logger: getMember 회원정보 가져오기: {}", getMember);

        //editMember.jsp에 getMember키로 모델맵 매핑
        model.addAttribute("getMember", getMember);
    	logger.info("logger: member_idx 현재 회원번호: {}", member_idx);
    	logger.info("logger: getMember 화면출력 {}", getMember);		
    	
        //editMember 수정 메서드
        model.put("memberDTO", memberDTO);
    	logger.info("logger: member_idx 현재 회원번호: {}", member_idx);
    	logger.info("logger: getMember 수정된 정보 {}", getMember);	
    	
        return "editMember"; 
    }
    
	@PostMapping("/editMemberSave")
		public String showEditMemberSuccessPage
								(ModelMap model, 
								 @Valid MemberDTO memberDTO, 
								 BindingResult result) {
		
		if(result.hasErrors()) {
			logger.info("logger 입력오류{}", "입력값 확인하세요!");
			return "redirect:editMember";
		}
		
		// 수정할 회원 정보 모델에 추가 + 뷰에 전달
		managerService.editMember(memberDTO);
		logger.info("logger memberDTO{}", "memberDTO");

		// 성공 메시지 표시 + 수정이 완료시 회원목록으로 리다이렉트
		logger.info("logger 수정성공{}", "수정성공!");

		return "redirect:memberList";
	}
	
	@PostMapping("/deleteMember")
	public String showDeleteMemberPage(@RequestParam("member_idx") String member_idx) {
		logger.info("logger 삭제요청 : {} ", member_idx);
		managerService.deleteMember(Integer.parseInt(member_idx));
		logger.info("logger 삭제처리 : {} ", member_idx);
		return "redirect:home";
	}
	
	
}
	
	















