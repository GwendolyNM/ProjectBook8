package com.exam.service;

import com.exam.dto.MemberDTO;

public interface MemberService {

	public int save(MemberDTO member_id);
	public MemberDTO findById(String member_id);
}
