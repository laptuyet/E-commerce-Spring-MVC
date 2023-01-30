package com.patinshop.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "Size")
public class SizeEntity {

	@Id
	@Column(name = "size_num")
	private Integer sizeNum;

	@OneToMany(mappedBy = "size", fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private List<ProductSizeEntity> productSize;

	public List<ProductSizeEntity> getProductSize() {
		return productSize;
	}

	public void setProductSize(List<ProductSizeEntity> productSize) {
		this.productSize = productSize;
	}

	public Integer getSizeNum() {
		return sizeNum;
	}

	public void setSizeNum(Integer sizeNum) {
		this.sizeNum = sizeNum;
	}

}
