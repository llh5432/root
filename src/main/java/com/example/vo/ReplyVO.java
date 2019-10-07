package com.example.vo;


public class ReplyVO {
	private int r_num;
	private String r_comment;
	private String r_replyDate;
	private int b_num;
	private String r_id;

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getR_comment() {
		return r_comment;
	}

	public void setR_comment(String r_comment) {
		this.r_comment = r_comment;
	}

	public String getR_replyDate() {
		return r_replyDate;
	}

	public void setR_replyDate(String r_replyDate) {
		this.r_replyDate = r_replyDate;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	@Override
	public String toString() {
		return "ReplyVO [r_num=" + r_num + ", r_comment=" + r_comment + ", r_replyDate=" + r_replyDate + ", b_num="
				+ b_num + ", r_id=" + r_id + "]";
	}

}
