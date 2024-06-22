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


	@Override
	public int idCheck(String member_id) {
		return  memberMapper.idCheck(member_id);
	}
//s.....
	@Override
	public MemberDTO findMypage(String member_id) {
		return memberMapper.findById(member_id);
	}



}
