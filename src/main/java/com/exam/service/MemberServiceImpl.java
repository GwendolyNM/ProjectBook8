package com.exam.service;

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



}
