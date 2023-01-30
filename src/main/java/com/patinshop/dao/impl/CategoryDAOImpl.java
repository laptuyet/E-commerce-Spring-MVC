package com.patinshop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patinshop.dao.CategoryDAO;
import com.patinshop.entity.CategoryEntity;
import com.patinshop.entity.ProductEntity;

@Transactional
@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public CategoryEntity findById(Integer id) {
		Session session = factory.getCurrentSession();
		CategoryEntity category = (CategoryEntity) session.get(CategoryEntity.class, id);
		return category;
	}
	
	@Override
	public List<CategoryEntity> findAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CategoryEntity";
		Query query = session.createQuery(hql);
		List<CategoryEntity> categories = query.list();
		return categories;
	}

	@Override
	public List<CategoryEntity> findAll(Boolean isAccessory) {
		Session session = factory.getCurrentSession();
		String hql = "FROM CategoryEntity c WHERE c.is_accessory = :check";
		Query query = session.createQuery(hql);
		query.setParameter("check", isAccessory);
		List<CategoryEntity> categories = query.list();
		return categories;
	}

	@Override
	public CategoryEntity create(CategoryEntity category) {
		Session session = factory.getCurrentSession();
		session.save(category);
		return category;
	}

	@Override
	public void update(CategoryEntity category) {
		Session session = factory.getCurrentSession();
		session.update(category);
	}

	@Override
	public void delete(Integer id) {
		Session session = factory.getCurrentSession();
		CategoryEntity category = (CategoryEntity)session.get(CategoryEntity.class, id);
		session.delete(category);
	}

	@Override
	public boolean isExisted(String name) {
		Session session = factory.getCurrentSession();
		String hql = "FROM CategoryEntity WHERE name = :name";
		Query q = session.createQuery(hql);
		q.setParameter("name", name);
		return q.uniqueResult() != null;
	}

}
