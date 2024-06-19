package com.exam.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	public int save(MemberDTO member_id);
	public MemberDTO findById(String member_id);
}
