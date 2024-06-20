package com.exam.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.BooksDTO;
import com.exam.service.BooksService;

@Controller
public class BookController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	BooksService booksService;
	
	public BookController(BooksService booksService) {
		this.booksService = booksService;
	}
	
	 @GetMapping("/books")
	    public String showBookList(ModelMap model, @RequestParam(value = "keyword", required = false) String keyword) {
	        List<BooksDTO> booksList;

	        if (keyword != null && !keyword.isEmpty()) {
	            booksList = booksService.searchBooksList(keyword);
	        } else {
	            booksList = booksService.booksList();
	        }

	        model.addAttribute("booksList", booksList);
	        return "books";
	    }
	 @GetMapping("/rent")
	    public String getUser(Model model) {
	        // 인증된 사용자 정보 가져오기
	        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	        String currentPrincipalName = authentication.getName();
	        
	        // 사용자 이름을 모델에 추가하여 JSP에 전달
	        model.addAttribute("username", currentPrincipalName);
	        logger.info("logger:{}", currentPrincipalName);
	        return "redirect:books";
	    }
	
}
