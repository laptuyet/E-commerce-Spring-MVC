package com.patinshop.dao;

import java.util.List;

import com.patinshop.entity.CustomerEntity;
import com.patinshop.entity.ProductEntity;

public interface CustomerDAO {
	
	CustomerEntity findById(String id);
	
	List<CustomerEntity> findAll();
	
	CustomerEntity create(CustomerEntity user);
	
	void update(CustomerEntity user);
	
	void delete(String id);

	List<ProductEntity> findItemsByUser(CustomerEntity cus);
}
