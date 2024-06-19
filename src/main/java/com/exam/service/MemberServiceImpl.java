package com.exam.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.MemberDTO;
import com.exam.mapper.MemberMapper;

@Service
public class MemberServiceImpl 
           implements MemberService{

	MemberMapper memberMapper;
	
	public MemberServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public int save(MemberDTO member_id) {
		return memberMapper.save(member_id);
	}

	@Override
	public MemberDTO findById(String member_id) {
		return memberMapper.findById(member_id);
	}

	@Override
	public List<MemberDTO> memberList() {
		return memberMapper.memberList();
	}

	@Override
	public List<MemberDTO> allMembers() {
		return memberMapper.memberList();
	}

	@Override
	public void editMember(MemberDTO memberDTO) {}



}
