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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.exam.dto.MemberDTO;
import com.exam.service.ManagerService;

@SessionAttributes(names = {"getMember"}) //request scope로 정보가 손실되므로 session scope 저장
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
	
    @GetMapping("/editMember")
    public String showEditMemberPage(ModelMap model, @RequestParam("member_idx") int member_idx) {
    	
    	//멤버리스트 생성
    	List<MemberDTO> getMember;
    	
    	//member_idx로 DB 회원 정보 가져온다.
    	getMember = managerService.getMember(member_idx);
    	logger.info("logger: member_idx 회원번호 가져오기: {}", member_idx);
    	logger.info("logger: getMember 회원정보 가져오기: {}", getMember);

        //editMember.jsp에 getMember키로 모델맵 매핑
        model.addAttribute("getMember", getMember);
    	logger.info("logger: member_idx 현재 회원번호: {}", member_idx);
    	logger.info("logger: getMember 화면출력 {}", getMember);	
    	logger.info("logger: model 화면출력 {}", model);	
    	
    	
        return "editMember"; 
    }
    
	@PostMapping("/editMember")
	public String showEditMemberSuccessPage
								(@RequestParam("member_id") String member_id,
								 @RequestParam("member_name") String member_name,
								 @RequestParam("member_phone1") String member_phone1,
								 @RequestParam("member_phone2") String member_phone2,
								 @RequestParam("member_phone3") String member_phone3,
								 @RequestParam("member_addressRoad") String member_addressRoad,
								 @RequestParam("member_addressJibun") String member_addressJibun,
								 @RequestParam("member_addressDetail") String member_addressDetail,
								 @Valid @ModelAttribute("getMember") MemberDTO getMember,
								 BindingResult result) {
		
		
		
		int member_idx=getMember.getMember_idx();
		
		logger.info("logger member_idx 수정 적용 전{}", member_idx);
		logger.info("logger member_id 수정 적용 전{}", member_id);
		logger.info("logger member_name 수정 적용 전{}", member_name);
		logger.info("logger member_phone1 수정 적용 전{}", member_phone1);
		logger.info("logger member_phone2 수정 적용 전{}", member_phone2);
		logger.info("logger member_phone3 수정 적용 전{}", member_phone3);
		logger.info("logger member_addressRoad 수정 적용 전{}", member_addressRoad);
		logger.info("logger member_addressJibun 수정 적용 전{}", member_addressJibun);
		logger.info("logger member_addressDetail 수정 적용 전{}", member_addressDetail);
		
		getMember = new MemberDTO();
		
		getMember.setMember_idx(member_idx);
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
		
		if(result.hasErrors()) {
			logger.info("logger 입력오류{}", "입력값 확인하세요!");
			return "redirect:editMember";
		}
		
		// 수정할 회원 정보 모델에 추가 + 뷰에 전달
        //editMember 수정 메서드
		managerService.editMember(getMember);
    	logger.info("logger: editMember DB 변경 {}", getMember);	

		// 성공 메시지 표시 + 수정이 완료시 회원목록으로 리다이렉트
		logger.info("logger: 수정성공 {}", "수정성공!");

		return "redirect:memberList";
	}
	
	@PostMapping("/deleteMember")
	public String showDeleteMemberPage(@RequestParam("member_idx") String member_idx) {
		logger.info("logger 삭제요청 : {} ", member_idx);
		managerService.deleteMember(Integer.parseInt(member_idx));
		logger.info("logger 삭제처리 : {} ", member_idx);
		return "redirect:memberList";
	}
	// 아아디 찾기 , 비밀번호 설정, 
	
}
	
	















