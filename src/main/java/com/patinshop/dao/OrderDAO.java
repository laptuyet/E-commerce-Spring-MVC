package com.patinshop.dao;

import java.util.List;

import com.patinshop.entity.OrderDetailEntity;
import com.patinshop.entity.OrderEntity;

public interface OrderDAO {
	
	OrderEntity findById(Integer id);
	
	List<OrderEntity> findAll();
	
	OrderEntity create(OrderEntity order);
	
	void update(OrderEntity order);
	
	void delete(Integer id);

	void create(OrderEntity order, List<OrderDetailEntity> details);
}
