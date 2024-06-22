package com.exam.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public MemberDTO findMypage(String member_id) {
		return memberMapper.findMypage(member_id);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void updateMypage(MemberDTO memberDTO) {
		this.memberMapper.updateMypage(memberDTO);
		
	}



}
