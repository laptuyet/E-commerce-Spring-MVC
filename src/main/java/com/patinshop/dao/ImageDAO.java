package com.patinshop.dao;

import java.util.List;

import com.patinshop.entity.ImageEntity;

public interface ImageDAO {
	
	ImageEntity findById(Integer id);
	
	List<ImageEntity> findAll();
	
	ImageEntity create(ImageEntity image);
	
	void update(ImageEntity image);
	
	void delete(Integer id);
}
