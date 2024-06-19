package com.exam.service;

import java.util.List;

import com.exam.dto.BooksDTO;
import com.exam.dto.MemberDTO;

public interface MemberService {

	
	public int save(MemberDTO member_id);
	public MemberDTO findById(String member_id);
	public List<MemberDTO> memberList();
<<<<<<< HEAD
	public MemberDTO idCheck(String member_id);
=======
	public List<MemberDTO> allMembers();
	public void editMember(MemberDTO memberDTO);
>>>>>>> HJG
}
