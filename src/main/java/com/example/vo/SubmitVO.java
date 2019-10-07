package com.example.vo;

public class SubmitVO {

	private int s_num;
	private String s_id;
	private String s_name;
	private String s_comment;
	private String s_type;
	private String s_reg_date;
	private String s_upgrade;

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_comment() {
		return s_comment;
	}

	public void setS_comment(String s_comment) {
		this.s_comment = s_comment;
	}

	public String getS_type() {
		return s_type;
	}

	public void setS_type(String s_type) {
		this.s_type = s_type;
	}


	public String getS_reg_date() {
		return s_reg_date;
	}

	public void setS_reg_date(String s_reg_date) {
		this.s_reg_date = s_reg_date;
	}

	public String getS_upgrade() {
		return s_upgrade;
	}

	public void setS_upgrade(String s_upgrade) {
		this.s_upgrade = s_upgrade;
	}

	@Override
	public String toString() {
		return "SubmitVO [s_num=" + s_num + ", s_id=" + s_id + ", s_name=" + s_name + ", s_comment=" + s_comment
				+ ", s_type=" + s_type + ", s_reg_date=" + s_reg_date + ", s_upgrade=" + s_upgrade + ", getS_num()="
				+ getS_num() + ", getS_id()=" + getS_id() + ", getS_name()=" + getS_name() + ", getS_comment()="
				+ getS_comment() + ", getS_type()=" + getS_type() + ", getS_reg_date()=" + getS_reg_date()
				+ ", getS_upgrade()=" + getS_upgrade() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}


}
