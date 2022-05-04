package com.wewishwell.shop.vo;

public class ProductVO {
	
	private int id;
	private String name;
	private int price;
	private String disc;
	private String category;
	
	public ProductVO() {}

	public ProductVO(int id, String name, int price, String disc, String category) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.disc = disc;
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDisc() {
		return disc;
	}

	public void setDisc(String disc) {
		this.disc = disc;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "ProductVO [id=" + id + ", name=" + name + ", price=" + price + ", disc=" + disc + ", category="
				+ category + "]";
	}
	
}
