package com.exam.service;

import java.util.List;

import com.exam.dto.MemberDTO;

public interface ManagerService {
	public List<MemberDTO> memberList();
	public void editMember(MemberDTO memberDTO);
	public MemberDTO idCheck2(String member_id);
}
