package com.exam.mapper;

import java.util.List;

import com.exam.dto.MemberDTO;

public interface ManagerMapper {
	public List<MemberDTO> memberList();
	public List<MemberDTO> editMember();
	public MemberDTO idCheck2(String member_id);

}
