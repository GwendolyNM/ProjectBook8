package com.exam.dto;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

@Alias("MemberDTO")
public class MemberDTO {
	int member_idx;
	String member_id;
	String member_pw;
	String member_name;
	String member_phone;
	LocalDate member_date;
	String member_address;
	boolean member_manager;
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(int member_idx, String member_id, String member_pw, String member_name, String member_phone,
			LocalDate member_date, String member_address, boolean member_manager) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_date = member_date;
		this.member_address = member_address;
		this.member_manager = member_manager;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public LocalDate getMember_date() {
		return member_date;
	}
	public void setMember_date(LocalDate member_date) {
		this.member_date = member_date;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public boolean isMember_manager() {
		return member_manager;
	}
	public void setMember_manager(boolean member_manager) {
		this.member_manager = member_manager;
	}
	@Override
	public String toString() {
		return "MemberDTO [member_idx=" + member_idx + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_name=" + member_name + ", member_phone=" + member_phone + ", member_date=" + member_date
				+ ", member_address=" + member_address + ", member_manager=" + member_manager + "]";
	}

	
	

}
