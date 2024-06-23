package com.exam.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.exam.dto.BooksDTO;
import com.exam.dto.MemberDTO;
import com.exam.mapper.ManagerMapper;

@Service
public class ManagerServiceImpl implements ManagerService{
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	ManagerMapper managerMapper;
	
	public ManagerServiceImpl(ManagerMapper managerMapper) {
		this.managerMapper = managerMapper;
	}
	
	//관리자 : 전체 회원정보 출력
	@Override
	public List<MemberDTO> memberList() {
		return managerMapper.memberList();
	}
	
	//관리자 : 특정 회원정보 가져오기
	@Override
	public List<MemberDTO> getMember(int member_idx) {
		return managerMapper.getMember(member_idx);
	}

	//관리자 : 회원정보 수정
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void editMember(MemberDTO memberDTO) {
		this.managerMapper.editMember(memberDTO);
	}

	//관리자 : 회원 삭제
	@Override
	public void deleteMember(int member_idx) {
		this.managerMapper.deleteMember(member_idx);
	}

	// 관리자 : 도서 추가
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int addBook(BooksDTO booksDTO) {
		logger.info("logger: Service 접근 booksDTO{}", booksDTO);
		return this.managerMapper.addBook(booksDTO);
	}

	@Override
	public List<BooksDTO> getBook(String book_idx) {
		return this.managerMapper.getBook(book_idx);
	}

	@Override
	public void updateBook(BooksDTO booksDTO) {
		this.managerMapper.updateBook(booksDTO);
		
	}

	@Override
	public void deleteBook(String book_idx) {
		this.managerMapper.deleteBook(book_idx);
	}

}
