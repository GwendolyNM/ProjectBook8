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

/*
	@PostMapping("/rent")
    public String rentBookController(@RequestParam("book_idx") String bookIdx, RentDTO rentDTO) {
      
	  // 인증된 사용자 정보 가져오기
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      logger.info("logger:Authentication:{}", auth);
      
      //인증괸 사용자를 MemberDTO 생성해서 아이디값을 DTO 담는다  
      MemberDTO memberDTO = (MemberDTO)auth.getPrincipal();
      
      //유저 변수 생성 후 DTO에서 아이디값을 가져온다
      String username = memberDTO.getMember_name();
      
      //rentDTO에 폼으로부터 받은 book_idx 정보를 담는다.
      rentDTO.setBook_idx(bookIdx);
      
      //rentDTO에 username 변수에 저장한 아이디 값을 담는다. 
      rentDTO.setMember_idx(username);
        
      //이제 rentDTO에 담은 책번호(book_idx)와 유저의 idx로 DB로 저장
      booksService.rentBook(rentDTO);
      logger.info("logger:Member:{}", memberDTO);
      
      //저장한 후에 books 페이지로 리다이렉트
      return "redirect:books";
    }
*/
	
    @PostMapping("/editMember")
    public String editMember(ModelMap model, @RequestParam("member_idx") 
    						 String member_idx, MemberDTO memberDTO) {
    	
    	//멤버리스트 생성
    	List<MemberDTO> getMember;
    	
    	//member_idx로 DB 회원 정보 가져온다.
    	getMember = managerService.getMember(Integer.parseInt(member_idx));
    	logger.info("logger: member_idx: {}", member_idx);
    	logger.info("logger: getMember {}", getMember);

        //editMember.jsp에 getMember키로 모델맵 매핑
        model.addAttribute("getMember", getMember);
		
        //editMember 수정 메서드
        return "editMember"; // editMember.jsp로 포워딩
    }
//	
//	@PostMapping("/editMember")
//		public String editMember(@Valid 
//								 @ModelAttribute("memberDTO") 
//								 MemberDTO memberDTO, 
//								 BindingResult result) {
//		
//		if(result.hasErrors()) {
//			logger.info("logger {}", "입력값 확인하세요!");
//			return "editMember";
//		}
//		
//		// 수정할 회원 정보 모델에 추가 + 뷰에 전달
//		
//		// 성공 메시지 표시 + 수정이 완료시 회원목록으로 리다이렉트 
//		return "redirect:editMember";
	}
	
	















