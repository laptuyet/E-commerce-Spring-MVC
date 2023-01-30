package com.patinshop.dao;

import java.util.List;

import com.patinshop.entity.ProductEntity;

public interface ProductDAO {
	
	ProductEntity findById(String id);
	
	List<ProductEntity> findAll(Boolean withAccessories);
	
	ProductEntity create(ProductEntity product);
	
	void update(ProductEntity product);
	
	void delete(String id);
	
	List<ProductEntity> findByKeywords(String keywords);

	List<ProductEntity> findByIds(String ids);

	List<ProductEntity> findBySpecialId(Integer sid);

	Integer getPageCount();

	List<ProductEntity> filterPrice(Double minPrice, Double maxPrice, Integer cateId);
}
