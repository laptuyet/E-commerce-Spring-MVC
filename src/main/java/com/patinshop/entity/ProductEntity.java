package com.patinshop.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

@Entity	
@Table(name = "Product")
public class ProductEntity {

	@Id
	@Size(max = 8, message = "Mã sản phẩm tối đa 8 ký tự!")
	@NotEmpty(message = "Mã sản phẩm trống!")
	private String id;

	@NotEmpty(message = "Tên sản phẩm trống!")
	private String title;
	
	@PositiveOrZero(message = "Giá sản phẩm phải lớn hơn hoặc bằng 0!")
	@NotNull(message = "Giá sản phẩm trống!")
	private Double price;

	private Double discount;

	@Column(name = "image_url")
	private String image;

	@Column(name = "prod_description")
	private String description;
	
	@Column(name = "create_at")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date createAt;
	
	@Column(name = "view_count")
	private Integer viewCount;
	
	private Boolean is_accessory;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private CategoryEntity category;

	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private List<OrderDetailEntity> orderDetails;

	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private List<ImageEntity> images;

	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	private List<ProductSizeEntity> productSize;

	public List<ProductSizeEntity> getProductSize() {
		return productSize;
	}

	public void setProductSize(List<ProductSizeEntity> productSize) {
		this.productSize = productSize;
	}

	public List<ImageEntity> getImages() {
		return images;
	}

	public void setImages(List<ImageEntity> images) {
		this.images = images;
	}

	public List<OrderDetailEntity> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetailEntity> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public CategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CategoryEntity category) {
		this.category = category;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public Boolean getIs_accessory() {
		return is_accessory;
	}

	public void setIs_accessory(Boolean is_accessory) {
		this.is_accessory = is_accessory;
	}
	
	
}
