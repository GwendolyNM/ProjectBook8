package com.exam.service;

import java.util.List;

import com.exam.dto.MemberDTO;

public interface MemberService {

	
	public int save(MemberDTO member_id);
	public MemberDTO findById(String member_id);
	public List<MemberDTO> memberList();
	public int idCheck(String member_id);
	public List<MemberDTO> allMembers();
	public void editMember(MemberDTO memberDTO);
}
