package com.patinshop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patinshop.dao.CustomerDAO;
import com.patinshop.entity.CustomerEntity;
import com.patinshop.entity.ProductEntity;

@Transactional
@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public CustomerEntity findById(String id) {
		Session session = factory.getCurrentSession();
		CustomerEntity user = (CustomerEntity) session.get(CustomerEntity.class, id);
		return user;
	}

	@Override
	public List<CustomerEntity> findAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CustomerEntity";
		Query query = session.createQuery(hql);
		List<CustomerEntity> users = query.list();
		return users;
	}

	@Override
	public CustomerEntity create(CustomerEntity user) {
		Session session = factory.getCurrentSession();
		session.save(user);
		return user;
	}

	@Override
	public void update(CustomerEntity user) {
		Session session = factory.getCurrentSession();
		session.update(user);
	}

	@Override
	public void delete(String id) {
		Session session = factory.getCurrentSession();
		CustomerEntity user = (CustomerEntity)session.get(CustomerEntity.class, id);
		session.delete(user);
	}

	@Override
	public List<ProductEntity> findItemsByUser(CustomerEntity cus) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT od.product FROM OrderDetailEntity od WHERE od.order.user.id = :uid";
		Query q = session.createQuery(hql);
		q.setParameter("uid", cus.getId());
		List<ProductEntity> prods = q.list();
		return prods;
	}
}
