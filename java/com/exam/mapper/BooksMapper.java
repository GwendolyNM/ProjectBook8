package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.BooksDTO;
import com.exam.dto.RentDTO;

@Mapper
public interface BooksMapper {

	public List<BooksDTO> booksList();
	public List<BooksDTO> searchBooksList(String keyword);
	public int rentBook(RentDTO rentDTO);
	public List<RentDTO> myBooksList(String keyword);
}
