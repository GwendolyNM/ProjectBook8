package com.exam.dto;

public class RentDTO {

	String book_idx;
	String member_idx;
	public RentDTO() {}
	public RentDTO(String book_idx, String member_idx) {
		this.book_idx = book_idx;
		this.member_idx = member_idx;
	}
	public String getBook_idx() {
		return book_idx;
	}
	public void setBook_idx(String book_idx) {
		this.book_idx = book_idx;
	}
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	@Override
	public String toString() {
		return "RentDTO [book_idx=" + book_idx + ", member_idx=" + member_idx + "]";
	}
	
	
}
