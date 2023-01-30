package com.patinshop.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patinshop.dao.ReportDAO;

@Repository
@Transactional
public class ReportDAOImpl implements ReportDAO {
	
	@Autowired
	SessionFactory factory;

	@Override
	public List<Object[]> inventory() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object[]> revenueByCategory() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT d.product.category.name, "
				+ "SUM(d.quantity), "
				+ "SUM(d.totalMoney) "
				+ "FROM OrderDetailEntity d "
				+ "GROUP BY (d.product.category.name)";
		Query q = session.createQuery(hql);
		List<Object[]> list = q.list();
		return list;
	}

	@Override
	public List<Object[]> revenueByCustomer() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT d.order.user.id, d.order.fullname, "
				+ "SUM(d.quantity), "
				+ "SUM(d.totalMoney) "
				+ "FROM OrderDetailEntity d "
				+ "GROUP BY d.order.user.id, d.order.fullname "
				+ "ORDER BY SUM(d.totalMoney) DESC";
		Query q = session.createQuery(hql);
		List<Object[]> list = q.list();
		return list;
	}

	@Override
	public List<Object[]> revenueByMonths(Date fromDate, Date toDate) {
		// TODO Auto-generated method stub
		return null;
	}

}
