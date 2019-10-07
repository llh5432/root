package com.example.vo;

public class OppaListVO {

	private int o_num;
	private int num;
	private int o_like;
	private String o_id;
	private String o_name;
	private int age;
	private String address;
	private String email;
	private String phone;
	private int total;
	private String o_reg_date;
	private String o_join_date;

	public int getO_like() {
		return o_like;
	}

	public void setO_like(int o_like) {
		this.o_like = o_like;
	}

	public int getO_num() {
		return o_num;
	}

	public void setO_num(int o_num) {
		this.o_num = o_num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getO_reg_date() {
		return o_reg_date;
	}

	public void setO_reg_date(String o_reg_date) {
		this.o_reg_date = o_reg_date;
	}

	public String getO_join_date() {
		return o_join_date;
	}

	public void setO_join_date(String o_join_date) {
		this.o_join_date = o_join_date;
	}

	@Override
	public String toString() {
		return "OppaListVO [o_num=" + o_num + ", num=" + num + ", o_id=" + o_id + ", o_name=" + o_name + ", age=" + age
				+ ", address=" + address + ", email=" + email + ", phone=" + phone + ", total=" + total
				+ ", o_reg_date=" + o_reg_date + ", o_join_date=" + o_join_date + "]";
	}

}
