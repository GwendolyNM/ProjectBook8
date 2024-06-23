package com.exam.dto;

public class RentDTO {

	String book_idx;
	String book_author;
	String book_pub;
	String book_name;
	String book_image;
	String member_idx;
	String member_id;
	String rent_date;
	String rent_return;
	public RentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RentDTO(String book_idx, String book_author, String book_pub, String book_name, String book_image,
			String member_idx, String member_id, String rent_date, String rent_return) {
		super();
		this.book_idx = book_idx;
		this.book_author = book_author;
		this.book_pub = book_pub;
		this.book_name = book_name;
		this.book_image = book_image;
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.rent_date = rent_date;
		this.rent_return = rent_return;
	}
	public String getBook_idx() {
		return book_idx;
	}
	public void setBook_idx(String book_idx) {
		this.book_idx = book_idx;
	}
	public String getbook_author() {
		return book_author;
	}
	public void setbook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_pub() {
		return book_pub;
	}
	public void setBook_pub(String book_pub) {
		this.book_pub = book_pub;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_image() {
		return book_image;
	}
	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getRent_date() {
		return rent_date;
	}
	public void setRent_date(String rent_date) {
		this.rent_date = rent_date;
	}
	public String getRent_return() {
		return rent_return;
	}
	public void setRent_return(String rent_return) {
		this.rent_return = rent_return;
	}
	@Override
	public String toString() {
		return "RentDTO [book_idx=" + book_idx + ", book_author=" + book_author + ", book_pub=" + book_pub
				+ ", book_name=" + book_name + ", book_image=" + book_image + ", member_idx=" + member_idx
				+ ", member_id=" + member_id + ", rent_date=" + rent_date + ", rent_return=" + rent_return + "]";
	}
	
}
