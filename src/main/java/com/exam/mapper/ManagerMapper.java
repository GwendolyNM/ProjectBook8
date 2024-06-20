package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.exam.dto.MemberDTO;

@Mapper
public interface ManagerMapper {
	public List<MemberDTO> memberList();
	public List<MemberDTO> editMember();
	
	public MemberDTO getMember(String member_id);
	
	public int saveMember(MemberDTO memberDTO);
	public int deleteMember(int member_idx);

}
