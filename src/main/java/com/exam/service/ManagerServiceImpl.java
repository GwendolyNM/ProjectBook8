package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
		return this.managerMapper.memberList();
	}

	@Override
	public List<MemberDTO> editMember() {
		return this.managerMapper.editMember();
	}

	@Override
	public MemberDTO getMember(int member_idx) {
		return this.managerMapper.getMember(member_idx);
	}

	@Override
	public MemberDTO idCheck2(String member_id) {
		return this.idCheck2(member_id);
	}

	@Override
	public int saveMember(MemberDTO memberDTO) {
		return this.managerMapper.saveMember(memberDTO);
	}

	@Override
	public int deleteMember(int member_idx) {
		return this.deleteMember(member_idx);
	}
	
}
