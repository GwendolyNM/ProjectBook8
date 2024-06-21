package com.exam.service;

import java.util.List;

import javax.validation.Valid;

import com.exam.dto.MemberDTO;

public interface ManagerService {
	public List<MemberDTO> memberList();
	public List<MemberDTO> getMember(int member_idx);
	public void editMember(MemberDTO memberDTO);
	public void deleteMember(int member_idx);
}
