package com.exam.service;

import java.util.List;

import com.exam.dto.BooksDTO;
import com.exam.dto.RentDTO;

public interface BooksService {

	public List<BooksDTO> booksList();
	public List<BooksDTO> searchBooksList(String keyword);
	public int rentBook(RentDTO rentDTO);
}
