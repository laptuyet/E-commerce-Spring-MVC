package com.patinshop.dao;

import java.util.List;

import com.patinshop.entity.ProductSizeEntity;

public interface ProductSizeDAO {
	
	List<ProductSizeEntity> findById(String id);
	
	List<ProductSizeEntity> findAll();
	
	ProductSizeEntity create(ProductSizeEntity productSize);
	
	void update(ProductSizeEntity productSize);
	
	void delete(String id);
	
	void deleteAllSizeOf(String id);

	boolean isExisted(String id, Integer integer);
}
