package com.patinshop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patinshop.dao.CusEmailsDAO;
import com.patinshop.entity.CusEmailsEntity;

@Repository
@Transactional
public class CusEmailsDAOImpl implements CusEmailsDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public CusEmailsEntity findById(Integer id) {
		Session session = factory.getCurrentSession();
		CusEmailsEntity ce = (CusEmailsEntity) session.get(CusEmailsEntity.class, id);
		return ce;
	}

	@Override
	public List<CusEmailsEntity> findAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CusEmailsEntity";
		Query query = session.createQuery(hql);
		List<CusEmailsEntity> lists = query.list();
		return lists;
	}

	@Override
	public CusEmailsEntity create(CusEmailsEntity cusEmail) {
		Session session = factory.getCurrentSession();
		session.save(cusEmail);
		return cusEmail;
	}

	@Override
	public void update(CusEmailsEntity cusEmail) {
		Session session = factory.getCurrentSession();
		session.update(cusEmail);
	}

	@Override
	public void delete(Integer id) {
		Session session = factory.getCurrentSession();
		CusEmailsEntity ce = (CusEmailsEntity) session.get(CusEmailsEntity.class, id);
		session.delete(ce);
	}

	@Override
	public boolean isExisted(String email) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT email FROM CusEmailsEntity WHERE email = :myMail";
		Query query = session.createQuery(hql);
		query.setParameter("myMail", email);
		return query.uniqueResult() != null;
	}

}
