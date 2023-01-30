package com.patinshop.dao;

import java.util.List;

import com.patinshop.entity.CusEmailsEntity;

public interface CusEmailsDAO {
	
	CusEmailsEntity findById(Integer id);

	List<CusEmailsEntity> findAll();
	
	CusEmailsEntity create(CusEmailsEntity cusEmail);
	
	void update(CusEmailsEntity cusEmail);
	
	void delete(Integer id);
	
	boolean isExisted(String email);
}
