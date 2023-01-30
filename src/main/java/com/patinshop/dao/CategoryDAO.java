package com.patinshop.dao;

import java.util.List;

import com.patinshop.entity.CategoryEntity;

public interface CategoryDAO {
	
	CategoryEntity findById(Integer id);
	
	List<CategoryEntity> findAll();
	
	List<CategoryEntity> findAll(Boolean isAccessory);
	
	CategoryEntity create(CategoryEntity category);
	
	void update(CategoryEntity category);
	
	void delete(Integer id);

	boolean isExisted(String name);
}
