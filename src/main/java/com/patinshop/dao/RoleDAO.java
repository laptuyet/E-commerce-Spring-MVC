package com.patinshop.dao;

import java.util.List;

import com.patinshop.entity.RoleEntity;

public interface RoleDAO {
	
	RoleEntity findById(Integer id);
	
	List<RoleEntity> findAll();
	
	RoleEntity create(RoleEntity role);
	
	void update(RoleEntity role);
	
	void delete(Integer id);
}
