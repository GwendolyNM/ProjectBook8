package com.exam.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.Member;

@Mapper
public interface MemberMapper {

	public int save(Member member_id);
	public Member findById(String member_id);
}
