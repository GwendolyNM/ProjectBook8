package com.exam.service;

import java.util.List;

import com.exam.dto.MemberDTO;

public interface ManagerService {
	public List<MemberDTO> memberList();
	public List<MemberDTO> getMember(int member_idx);
}
