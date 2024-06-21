package com.exam.dto;

import java.time.LocalDate;
import java.util.Collection;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Alias("MemberDTO")
public class MemberDTO{
	int member_idx;
	
	@NotBlank(message = "id를 입력해주세요")
	String member_id;
	
	@NotBlank(message = "비밀번호를 입력해주세요")
	@Size(min = 1, message = "비밀번호는 최소 8자 이상이어야 합니다.")
	String member_pw;
	
	@NotBlank(message = "이름을 입력해주세요")
	String member_name;
	
	String member_phone1;
	String member_phone2;
	String member_phone3;
	
	LocalDate member_date;
	
	String member_addressRoad;
	String member_addressJibun;
	String member_addressDetail;
	
	boolean member_manager;
	
	public MemberDTO() {
	}

	public MemberDTO(int member_idx, String member_id, String member_pw, String member_name, String member_phone1,
			String member_phone2, String member_phone3, LocalDate member_date, String member_addressRoad,
			String member_addressJibun, String member_addressDetail, boolean member_manager) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_phone1 = member_phone1;
		this.member_phone2 = member_phone2;
		this.member_phone3 = member_phone3;
		this.member_date = member_date;
		this.member_addressRoad = member_addressRoad;
		this.member_addressJibun = member_addressJibun;
		this.member_addressDetail = member_addressDetail;
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

	public String getMember_phone1() {
		return member_phone1;
	}

	public void setMember_phone1(String member_phone1) {
		this.member_phone1 = member_phone1;
	}

	public String getMember_phone2() {
		return member_phone2;
	}

	public void setMember_phone2(String member_phone2) {
		this.member_phone2 = member_phone2;
	}

	public String getMember_phone3() {
		return member_phone3;
	}

	public void setMember_phone3(String member_phone3) {
		this.member_phone3 = member_phone3;
	}

	public LocalDate getMember_date() {
		return member_date;
	}

	public void setMember_date(LocalDate member_date) {
		this.member_date = member_date;
	}

	public String getMember_addressRoad() {
		return member_addressRoad;
	}

	public void setMember_addressRoad(String member_addressRoad) {
		this.member_addressRoad = member_addressRoad;
	}

	public String getMember_addressJibun() {
		return member_addressJibun;
	}

	public void setMember_addressJibun(String member_addressJibun) {
		this.member_addressJibun = member_addressJibun;
	}

	public String getMember_addressDetail() {
		return member_addressDetail;
	}

	public void setMember_addressDetail(String member_addressDetail) {
		this.member_addressDetail = member_addressDetail;
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
				+ ", member_name=" + member_name + ", member_phone1=" + member_phone1 + ", member_phone2="
				+ member_phone2 + ", member_phone3=" + member_phone3 + ", member_date=" + member_date
				+ ", member_addressRoad=" + member_addressRoad + ", member_addressJibun=" + member_addressJibun
				+ ", member_addressDetail=" + member_addressDetail + ", member_manager=" + member_manager + "]";
	}

	

	
	

}
