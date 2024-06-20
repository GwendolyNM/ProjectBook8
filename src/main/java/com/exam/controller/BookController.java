package com.exam.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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
	
}
