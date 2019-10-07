package com.example.vo;


public class BookVO {

	private int book_num;
	private String id;
	private String model;
	private String book_date;
	private String content;
	private String reg_date;
	private String type;
	private int pay;
	private String book;
	private String meet;

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getBook_date() {
		return book_date;
	}

	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getBook() {
		return book;
	}

	public void setBook(String book) {
		this.book = book;
	}

	public String getMeet() {
		return meet;
	}

	public void setMeet(String meet) {
		this.meet = meet;
	}

	@Override
	public String toString() {
		return "BookVO [book_num=" + book_num + ", id=" + id + ", model=" + model + ", book_date=" + book_date
				+ ", content=" + content + ", reg_date=" + reg_date + ", type=" + type + ", pay=" + pay + ", book="
				+ book + ", meet=" + meet + "]";
	}
	
}
