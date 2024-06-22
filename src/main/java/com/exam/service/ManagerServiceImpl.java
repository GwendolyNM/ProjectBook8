package com.exam.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.exam.dto.MemberDTO;
import com.exam.mapper.ManagerMapper;

@Service
public class ManagerServiceImpl implements ManagerService{
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	ManagerMapper managerMapper;
	
	public ManagerServiceImpl(ManagerMapper managerMapper) {
		this.managerMapper = managerMapper;
	}
	
	@Override
	public List<MemberDTO> memberList() {
		return managerMapper.memberList();
	}

	@Override
	public List<MemberDTO> getMember(int member_idx) {
		return managerMapper.getMember(member_idx);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void editMember(MemberDTO memberDTO) {
		this.managerMapper.editMember(memberDTO);
		managerMapper.getMember(memberDTO.getMember_idx());
		List<MemberDTO> temp = managerMapper.getMember(memberDTO.getMember_idx());
		logger.info("logger: {}", temp);
		logger.info("logger: {}", memberDTO);
	}

	@Override
	public void deleteMember(int member_idx) {
		this.managerMapper.deleteMember(member_idx);
	}

}
