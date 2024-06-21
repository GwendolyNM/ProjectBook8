package com.exam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.MemberDTO;
import com.exam.mapper.ManagerMapper;

@Service
public class ManagerServiceImpl implements ManagerService{
	
	ManagerMapper managerMapper;
	
	public ManagerServiceImpl(ManagerMapper managerMapper) {
		this.managerMapper = managerMapper;
	}
	
	@Override
	public List<MemberDTO> memberList() {
		return managerMapper.memberList();
	}

	@Override
	public List<MemberDTO> getMember(int member_idx) {
		return managerMapper.getMember(member_idx);
	}

}
