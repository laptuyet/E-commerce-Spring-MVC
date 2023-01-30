package com.patinshop.dao;

import java.util.List;

import com.patinshop.entity.SizeEntity;

public interface SizeDAO {
	
	SizeEntity findBySizeNum(Integer sizeNum);
	
	List<SizeEntity> findAll();
	
	SizeEntity create(SizeEntity size);
	
	void update(SizeEntity size);
	
	void delete(Integer sizeNum);
}
