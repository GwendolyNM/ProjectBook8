package com.exam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.BooksDTO;
import com.exam.mapper.BooksMapper;

@Service
public class BooksServiceImpl implements BooksService{

	

	BooksMapper booksMapper;
	
	public BooksServiceImpl(BooksMapper booksMapper) {
		this.booksMapper = booksMapper;
	}

	@Override
	public List<BooksDTO> booksList() {
		return booksMapper.booksList();
	}

	@Override
	public void bookReserve() {
		
		
	}
	
	

}
