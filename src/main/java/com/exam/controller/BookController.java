package com.exam.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.exam.dto.BooksDTO;
import com.exam.service.BooksService;

@Controller
public class BookController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	BooksService booksService;
	
	public BookController(BooksService booksService) {
		this.booksService = booksService;
	}
	
	@GetMapping(value={ "/books"})
	public String showHomePage(ModelMap m) {
		
			List<BooksDTO> booksList = booksService.booksList();
			m.addAttribute("booksList", booksList);
		return "books";
	}
}
