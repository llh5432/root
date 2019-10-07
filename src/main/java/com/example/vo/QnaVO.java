package com.example.vo;

public class QnaVO {

	
	private int q_num;
	private String q_id;
	private String q_type;
	private String q_title;
	private String q_content;
	private String re_content;
	private String reg_date;
	private String reply;
	private String re_date;
	
	
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getQ_id() {
		return q_id;
	}
	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}
	public String getQ_type() {
		return q_type;
	}
	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
	@Override
	public String toString() {
		return "qnaBoardVO [q_num=" + q_num + ", q_id=" + q_id + ", q_type=" + q_type + ", q_title=" + q_title
				+ ", q_content=" + q_content + ", re_content=" + re_content + ", reg_date=" + reg_date + ", reply="
				+ reply + ", re_date=" + re_date + "]";
	}

}
