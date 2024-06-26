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

import com.exam.dto.BooksDTO;
import com.exam.dto.MemberDTO;
import com.exam.dto.RentDTO;
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
        logger.info("logger:bookList:{}", model);
        return "books";
    }
 	
 	@GetMapping("/myBooks")
    public String showMyBookList(ModelMap model) {
 		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDTO memberDTO = (MemberDTO)auth.getPrincipal();
		int userIdx = memberDTO.getMember_idx();
		logger.info("logger:로그인중인 아이디:{}", userIdx);
		
		List<RentDTO> booksList;
		booksList = booksService.myBooksList(String.valueOf(userIdx));
		logger.info("logger:booksList:{}", booksList);
		model.addAttribute("myBooksList",booksList);
        return "myBooks";
    }
 	
	@PostMapping("/rent")
	public String rentBookController(@RequestParam("book_idx") String bookIdx, RentDTO rentDTO) {
	    
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MemberDTO memberDTO = (MemberDTO)auth.getPrincipal();
		String userId = memberDTO.getMember_id();
		logger.info("logger:Member:{}", userId);
		
		rentDTO.setBook_idx(bookIdx);
	    rentDTO.setMember_id(userId);
	    logger.info("logger:Member:{}", rentDTO);
	    booksService.rentBook(rentDTO);
	    return "redirect:books";
	}
	@PostMapping("/deleteMyBook")
	public String deleteMyBook(@RequestParam("book_idx") String book_idx) {
		logger.info("logger 삭제요청 : {} ", book_idx);
		booksService.deleteMyBook(book_idx);
		logger.info("logger 삭제처리 : {} ", book_idx);
		return "redirect:myBooks";
	}
}
