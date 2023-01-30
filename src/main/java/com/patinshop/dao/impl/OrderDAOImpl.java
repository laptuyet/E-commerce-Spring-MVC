package com.patinshop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patinshop.dao.OrderDAO;
import com.patinshop.entity.OrderDetailEntity;
import com.patinshop.entity.OrderEntity;

@Transactional
@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public OrderEntity findById(Integer id) {
		Session session = factory.getCurrentSession();
		OrderEntity order = (OrderEntity) session.get(OrderEntity.class, id);
		return order;
	}

	@Override
	public List<OrderEntity> findAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM OrderEntity";
		Query query = session.createQuery(hql);
		List<OrderEntity> orders = query.list();
		return orders;
	}

	@Override
	public OrderEntity create(OrderEntity order) {
		Session session = factory.getCurrentSession();
		session.save(order);
		return order;
	}

	@Override
	public void update(OrderEntity order) {
		Session session = factory.getCurrentSession();
		session.update(order);
	}

	@Override
	public void delete(Integer id) {
		Session session = factory.getCurrentSession();
		OrderEntity order = (OrderEntity)session.get(OrderEntity.class, id);
		session.delete(order);
	}

	@Override
	public void create(OrderEntity order, List<OrderDetailEntity> details) {
		Session session = factory.getCurrentSession();
		session.save(order);
		order.setOrderDetails(details);
		for(OrderDetailEntity detail : details) {
			session.save(detail);
		}
	}
}
