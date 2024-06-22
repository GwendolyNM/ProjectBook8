package com.exam.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.exam.dto.MemberDTO;


public interface MemberService {

	public int save(MemberDTO member_id);
	public MemberDTO findById(String member_id);
	public int idCheck(String member_id);
	public MemberDTO findMypage (String member_id);
	public void updateMypage(MemberDTO memberDTO);
}
