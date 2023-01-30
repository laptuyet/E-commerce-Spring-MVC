package com.patinshop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patinshop.dao.OrderDetailDAO;
import com.patinshop.entity.OrderDetailEntity;

@Transactional
@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public List<OrderDetailEntity> findById(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderDetailEntity od WHERE od.order.id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<OrderDetailEntity> orderDetails = query.list();
		return orderDetails;
	}

	@Override
	public List<OrderDetailEntity> findAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderDetailEntity";
		Query query = session.createQuery(hql);
		List<OrderDetailEntity> orderDetails = query.list();
		return orderDetails;
	}

	@Override
	public OrderDetailEntity create(OrderDetailEntity orderDetail) {
		Session session = factory.getCurrentSession();
		session.save(orderDetail);
		return orderDetail;
	}

	@Override
	public void update(OrderDetailEntity orderDetail) {
		Session session = factory.getCurrentSession();
		session.update(orderDetail);
	}

	@Override
	public void delete(Integer id) {
		Session session = factory.getCurrentSession();
		OrderDetailEntity orderDetail = (OrderDetailEntity)session.get(OrderDetailEntity.class, id);
		session.delete(orderDetail);
	}
}
