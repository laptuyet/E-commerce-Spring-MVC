package com.patinshop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patinshop.dao.RoleDAO;
import com.patinshop.entity.RoleEntity;

@Transactional
@Repository
public class RoleDAOImpl implements RoleDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public RoleEntity findById(Integer id) {
		Session session = factory.getCurrentSession();
		RoleEntity role = (RoleEntity) session.get(RoleEntity.class, id);
		return role;
	}

	@Override
	public List<RoleEntity> findAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM RoleEntity";
		Query query = session.createQuery(hql);
		List<RoleEntity> roles = query.list();
		return roles;
	}

	@Override
	public RoleEntity create(RoleEntity role) {
		Session session = factory.getCurrentSession();
		session.save(role);
		return role;
	}

	@Override
	public void update(RoleEntity role) {
		Session session = factory.getCurrentSession();
		session.update(role);
	}

	@Override
	public void delete(Integer id) {
		Session session = factory.getCurrentSession();
		RoleEntity role = (RoleEntity)session.get(RoleEntity.class, id);
		session.delete(role);
	}
}
