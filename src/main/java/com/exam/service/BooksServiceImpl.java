package com.exam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.BooksDTO;
import com.exam.dto.RentDTO;
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
	public List<BooksDTO> searchBooksList(String keyword) {
		return booksMapper.searchBooksList(keyword);
	}

	@Override
	public int rentBook(RentDTO rentDTO) {
		return booksMapper.rentBook(rentDTO);
	}

		

}
