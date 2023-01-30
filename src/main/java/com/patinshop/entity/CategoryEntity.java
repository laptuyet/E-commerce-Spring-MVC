package com.patinshop.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "Category")
public class CategoryEntity {

	@Id
	@GeneratedValue
	private Integer id;
	
	@NotBlank(message = "Tên danh mục không bỏ trống!")
	@Column(name = "cate_name")
	private String name;

	@OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private List<ProductEntity> products;
	
	private Boolean is_accessory;

	public List<ProductEntity> getProducts() {
		return products;
	}

	public void setProducts(List<ProductEntity> products) {
		this.products = products;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Boolean getIs_accessory() {
		return is_accessory;
	}

	public void setIs_accessory(Boolean is_accessory) {
		this.is_accessory = is_accessory;
	}
}
