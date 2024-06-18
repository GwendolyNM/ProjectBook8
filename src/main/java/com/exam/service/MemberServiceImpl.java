package com.exam.service;

import org.springframework.stereotype.Service;

import com.exam.dto.Member;
import com.exam.mapper.MemberMapper;

@Service
public class MemberServiceImpl 
           implements MemberService{

	MemberMapper memberMapper;
	
	public MemberServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public int save(Member member_id) {
		return memberMapper.save(member_id);
	}

	@Override
	public Member findById(String member_id) {
		return memberMapper.findById(member_id);
	}



}
