package com.example.vo;

public class CarouselVO {

	private String b_id;
	private String b_image;
	private String b_model;
	private String b_title;

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_image() {
		return b_image;
	}

	public void setB_image(String b_image) {
		this.b_image = b_image;
	}

	public String getB_model() {
		return b_model;
	}

	public void setB_model(String b_model) {
		this.b_model = b_model;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	@Override
	public String toString() {
		return "CarouselVO [b_id=" + b_id + ", b_image=" + b_image + ", b_model=" + b_model + ", b_title=" + b_title
				+ "]";
	}
}