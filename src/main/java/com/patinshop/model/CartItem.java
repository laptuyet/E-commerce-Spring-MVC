package com.patinshop.model;

import com.patinshop.entity.ProductEntity;

public class CartItem {
	private ProductEntity product;
	private int prodSize;
	private int quantity;

	public CartItem() {

	}

	public CartItem(ProductEntity product, int quantity) {
		this.product = product;
		this.quantity = quantity;
	}

	public ProductEntity getProduct() {
		return product;
	}

	public void setProduct(ProductEntity product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getProdSize() {
		return prodSize;
	}

	public void setProdSize(int prodSize) {
		this.prodSize = prodSize;
	}
	
}
