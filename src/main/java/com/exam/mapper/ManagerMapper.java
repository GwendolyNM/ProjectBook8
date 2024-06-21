package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.MemberDTO;

@Mapper
public interface ManagerMapper {
	public List<MemberDTO> memberList();
	public List<MemberDTO> getMember(int member_idx);
	public void editMember(MemberDTO memberDTO);
	public void deleteMember(int member_idx);

}
