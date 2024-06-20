package com.exam.service;

import java.util.List;

import com.exam.dto.MemberDTO;

public interface ManagerService {
	public List<MemberDTO> memberList();
	public List<MemberDTO> editMember();
	
	public MemberDTO getMember(String member_id);
	
	public int saveMember(MemberDTO memberDTO);
	public int deleteMember(int member_idx);
}
