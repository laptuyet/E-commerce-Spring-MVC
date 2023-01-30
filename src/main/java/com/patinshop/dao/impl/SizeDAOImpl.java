package com.patinshop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patinshop.dao.SizeDAO;
import com.patinshop.entity.SizeEntity;

@Transactional
@Repository
public class SizeDAOImpl implements SizeDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public SizeEntity findBySizeNum(Integer sizeNum) {
		Session session = factory.getCurrentSession();
		SizeEntity size = (SizeEntity) session.get(SizeEntity.class, sizeNum);
		return size;
	}

	@Override
	public List<SizeEntity> findAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SizeEntity";
		Query query = session.createQuery(hql);
		List<SizeEntity> sizes = query.list();
		return sizes;
	}

	@Override
	public SizeEntity create(SizeEntity size) {
		Session session = factory.getCurrentSession();
		session.save(size);
		return size;
	}

	@Override
	public void update(SizeEntity size) {
		Session session = factory.getCurrentSession();
		session.update(size);
	}

	@Override
	public void delete(Integer sizeNum) {
		Session session = factory.getCurrentSession();
		SizeEntity size = (SizeEntity)session.get(SizeEntity.class, sizeNum);
		session.delete(size);
	}
}
