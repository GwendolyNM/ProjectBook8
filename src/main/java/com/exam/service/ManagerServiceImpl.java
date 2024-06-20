package com.exam.service;

import java.util.List;

import com.exam.dto.MemberDTO;
import com.exam.mapper.ManagerMapper;

public class ManagerServiceImpl implements ManagerService{
	
	ManagerMapper managerMapper;
	
	@Override
	public List<MemberDTO> memberList() {
		return managerMapper.memberList();
	}
	
	@Override
	public void editMember(MemberDTO memberDTO) {}

	@Override
	public MemberDTO idCheck2(String member_id) {
		return managerMapper.idCheck2(member_id);
	}
	
}
