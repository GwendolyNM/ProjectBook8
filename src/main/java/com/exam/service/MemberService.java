package com.exam.service;

import com.exam.dto.Member;

public interface MemberService {

	public int save(Member member_id);
	public Member findById(String member_id);
}
