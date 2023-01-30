package com.patinshop.dao;

import java.util.List;

import com.patinshop.entity.OrderDetailEntity;

public interface OrderDetailDAO {
	
	List<OrderDetailEntity> findById(Integer id);
	
	List<OrderDetailEntity> findAll();
	
	OrderDetailEntity create(OrderDetailEntity orderDetail);
	
	void update(OrderDetailEntity orderDetail);
	
	void delete(Integer id);
}
