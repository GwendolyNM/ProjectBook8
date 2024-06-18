package com.exam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.GoodsDTO;
import com.exam.mapper.BooksMapper;

@Service
public class BooksServiceImpl implements BooksService{

	BooksMapper booksMapper;
	
	public BooksServiceImpl(BooksMapper goodsMapper) {
		this.booksMapper = goodsMapper;
	}

	@Override
	public List<GoodsDTO> booksList() {
		return booksMapper.booksList();
	}

}
