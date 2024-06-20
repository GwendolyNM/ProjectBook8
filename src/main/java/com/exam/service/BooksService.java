package com.exam.service;

import java.util.List;

import com.exam.dto.BooksDTO;

public interface BooksService {

	public List<BooksDTO> booksList();
	public List<BooksDTO> searchBooksList(String keyword);
	public void bookReserve();
}
