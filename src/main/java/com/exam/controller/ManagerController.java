package com.exam.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String showMemberList(ModelMap model){
		
		List<MemberDTO> memberList = managerService.memberList();
		model.addAttribute("memberList", memberList);
		model.getAttribute("member_id");
		return "memberList";
	}
	
    @GetMapping("/editMember")
    public String editMember(@RequestParam("member_id") 
    						 String member_id, 
    						 ModelMap model) {
    	
        // memberId를 이용하여 DB에서 회원 정보 조회
        MemberDTO memberDTO = managerService.getMember(member_id);

        logger.info("logger {}", member_id);
        logger.info("logger {}", memberDTO);
        
        // 조회된 회원 정보를 모델에 추가하여 JSP로 전달
        model.addAttribute("memberDTO", memberDTO);
        
        logger.info("logger {}", memberDTO);
		// 폼에서 전달된 member의 member_idx를 해당 회원 정보 가져오기
		member_id = memberDTO.getMember_id();
		memberDTO = managerService.getMember(member_id);
		
        return "editMember"; // editMember.jsp로 포워딩
    }
	
	@PostMapping(value={"/editMember"})
		public String editMember(@Valid 
								 @ModelAttribute("memberDTO") 
								 MemberDTO memberDTO, 
								 BindingResult result) {
		
		if(result.hasErrors()) {
			logger.info("logger {}", "입력값 확인하세요!");
			return "editMember";
		}
		
		// 수정할 회원 정보 모델에 추가 + 뷰에 전달
		
		// 성공 메시지 표시 + 수정이 완료시 회원목록으로 리다이렉트 
		return "editMember";
	}
	
}
