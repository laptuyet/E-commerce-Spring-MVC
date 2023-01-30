package com.patinshop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patinshop.dao.ProductSizeDAO;
import com.patinshop.entity.ProductSizeEntity;

@Transactional
@Repository
public class ProductSizeDAOImpl implements ProductSizeDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public List<ProductSizeEntity> findById(String id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductSizeEntity WHERE id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<ProductSizeEntity> productSizes = query.list();
		return productSizes;
	}

	@Override
	public List<ProductSizeEntity> findAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductSizeEntity";
		Query query = session.createQuery(hql);
		List<ProductSizeEntity> productSizes = query.list();
		return productSizes;
	}

	@Override
	public ProductSizeEntity create(ProductSizeEntity productSize) {
		Session session = factory.getCurrentSession();
		session.save(productSize);
		return productSize;
	}

	@Override
	public void update(ProductSizeEntity productSize) {
		Session session = factory.getCurrentSession();
		session.update(productSize);
	}

	@Override
	public void delete(String id) {
		Session session = factory.getCurrentSession();
		ProductSizeEntity productSize = (ProductSizeEntity)session.get(ProductSizeEntity.class, id);
		session.delete(productSize);
	}

	@Override
	public boolean isExisted(String id, Integer size) {
		Session session = factory.getCurrentSession();
		
		deleteAllSizeOf(id);
		
		String hql = "FROM ProductSizeEntity WHERE product.id = :id AND size.sizeNum = :size";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.setParameter("size", size);
		return query.uniqueResult() != null;
	}

	@Override
	public void deleteAllSizeOf(String id) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE ProductSizeEntity WHERE product.id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.executeUpdate();
	}
}
