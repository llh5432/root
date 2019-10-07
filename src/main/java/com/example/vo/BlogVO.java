package com.example.vo;


public class BlogVO {

	private int b_num;
	private String b_id;
	private String b_name;
	private String b_model;
	private String b_image;
	private int b_likeCount;
	private String b_likeMember;
	private String b_title;
	private String b_content;
	private String b_reg_date;
	private int b_readCount;
	private int replyCount;
	private int b_replyCount;

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_model() {
		return b_model;
	}

	public void setB_model(String b_model) {
		this.b_model = b_model;
	}

	public String getB_image() {
		return b_image;
	}

	public void setB_image(String b_image) {
		this.b_image = b_image;
	}

	public int getB_likeCount() {
		return b_likeCount;
	}

	public void setB_likeCount(int b_likeCount) {
		this.b_likeCount = b_likeCount;
	}

	public String getB_likeMember() {
		return b_likeMember;
	}

	public void setB_likeMember(String b_likeMember) {
		this.b_likeMember = b_likeMember;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_reg_date() {
		return b_reg_date;
	}

	public void setB_reg_date(String b_reg_date) {
		this.b_reg_date = b_reg_date;
	}

	public int getB_readCount() {
		return b_readCount;
	}

	public void setB_readCount(int b_readCount) {
		this.b_readCount = b_readCount;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getB_replyCount() {
		return b_replyCount;
	}

	public void setB_replyCount(int b_replyCount) {
		this.b_replyCount = b_replyCount;
	}

	@Override
	public String toString() {
		return "BlogVO [b_num=" + b_num + ", b_id=" + b_id + ", b_name=" + b_name + ", b_model=" + b_model
				+ ", b_image=" + b_image + ", b_likeCount=" + b_likeCount + ", b_likeMember=" + b_likeMember
				+ ", b_title=" + b_title + ", b_content=" + b_content + ", b_reg_date=" + b_reg_date + ", b_readCount="
				+ b_readCount + ", replyCount=" + replyCount + ", b_replyCount=" + b_replyCount + "]";
	}
}
