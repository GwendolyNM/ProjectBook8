package com.exam.dto;

public class BooksDTO {
	
	String book_idx;
	String book_author;
	String book_pub;
	String book_name;
	int book_year;
	String book_ISBN;
	String book_image;
	String book_genre;
	int book_genre_idx;
	public BooksDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BooksDTO(String book_idx, String book_author, String book_pub, String book_name, int book_year,
			String book_ISBN, String book_image, String book_genre, int book_genre_idx) {
		super();
		this.book_idx = book_idx;
		this.book_author = book_author;
		this.book_pub = book_pub;
		this.book_name = book_name;
		this.book_year = book_year;
		this.book_ISBN = book_ISBN;
		this.book_image = book_image;
		this.book_genre = book_genre;
		this.book_genre_idx = book_genre_idx;
	}
	public String getBook_idx() {
		return book_idx;
	}
	public void setBook_idx(String book_idx) {
		this.book_idx = book_idx;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
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
	public int getBook_year() {
		return book_year;
	}
	public void setBook_year(int book_year) {
		this.book_year = book_year;
	}
	public String getBook_ISBN() {
		return book_ISBN;
	}
	public void setBook_ISBN(String book_ISBN) {
		this.book_ISBN = book_ISBN;
	}
	public String getBook_image() {
		return book_image;
	}
	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}
	public String getBook_genre() {
		return book_genre;
	}
	public void setBook_genre(String book_genre) {
		this.book_genre = book_genre;
	}
	public int getBook_genre_idx() {
		return book_genre_idx;
	}
	public void setBook_genre_idx(int book_genre_idx) {
		this.book_genre_idx = book_genre_idx;
	}
	@Override
	public String toString() {
		return "BooksDTO [book_idx=" + book_idx + ", book_author=" + book_author + ", book_pub=" + book_pub
				+ ", book_name=" + book_name + ", book_year=" + book_year + ", book_ISBN=" + book_ISBN + ", book_image="
				+ book_image + ", book_genre=" + book_genre + ", book_genre_idx=" + book_genre_idx + "]";
	}
	
	
}	