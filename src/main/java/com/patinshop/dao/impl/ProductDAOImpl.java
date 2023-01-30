package com.patinshop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patinshop.dao.ProductDAO;
import com.patinshop.entity.ProductEntity;

@Transactional
@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public ProductEntity findById(String id) {
		Session session = factory.getCurrentSession();
		ProductEntity product = (ProductEntity) session.get(ProductEntity.class, id);
		return product;
	}

	@Override
	public List<ProductEntity> findAll(Boolean withAccessories) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductEntity WHERE is_accessory = :check";
		Query query = session.createQuery(hql);
		query.setParameter("check", withAccessories);
		List<ProductEntity> products = query.list();
		return products;
	}

	@Override
	public ProductEntity create(ProductEntity product) {
		Session session = factory.getCurrentSession();
		session.save(product);
		return product;
	}

	@Override
	public void update(ProductEntity product) {
		Session session = factory.getCurrentSession();
		session.update(product);
	}

	@Override
	public void delete(String id) {
		Session session = factory.getCurrentSession();
		ProductEntity product = (ProductEntity) session.get(ProductEntity.class, id);
		session.delete(product);
	}

	@Override
	public List<ProductEntity> findByKeywords(String keywords) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductEntity p WHERE p.title LIKE :kw OR p.category.name LIKE :kw";
		Query query = session.createQuery(hql);
		query.setParameter("kw", "%" + keywords + "%");
		List<ProductEntity> products = query.list();
		return products;
	}

	@Override
	public List<ProductEntity> findByIds(String ids) {

		String[] id = ids.split("\\,");
		for (int i = 0; i < id.length; i++) {
			id[i] = ("'" + id[i] + "'");
		}
		ids = String.join(",", id);
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductEntity p WHERE p.id IN(" + ids + ")";
		Query query = session.createQuery(hql);
		List<ProductEntity> products = query.list();
		return products;
	}

	@Override
	public List<ProductEntity> findBySpecialId(Integer sid) {

		String hql = "FROM ProductEntity p";

		switch (sid) {
		case 1: { // mới nhất
			hql += " ORDER BY p.createAt DESC";
			break;
		}
		case 2: { // xem nhiều nhất
			hql += " ORDER BY p.viewCount DESC";
			break;
		}
		case 3: { // bán chạy nhất
			hql += " ORDER BY size(p.orderDetails) DESC";
			break;
		}
		}
		Session ss = factory.getCurrentSession();
		Query q = ss.createQuery(hql);
		q.setMaxResults(8);
		List<ProductEntity> list = q.list();
		return list;
	}

	@Override
	public Integer getPageCount() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT COUNT(*) FROM ProductEntity";
		Query query = session.createQuery(hql);
		Integer rowCount = (Integer) query.uniqueResult();
		return rowCount;
	}

	@Override
	public List<ProductEntity> filterPrice(Double minPrice, Double maxPrice, Integer cateId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductEntity p WHERE (p.price BETWEEN :minPrice AND :maxPrice"
				+ " OR p.discount BETWEEN :minPrice AND :maxPrice)";
		if (cateId != null) {
			hql += " AND p.category.id = " + cateId;
		}

		Query q = session.createQuery(hql);
		q.setParameter("minPrice", minPrice);
		q.setParameter("maxPrice", maxPrice);
		List<ProductEntity> list = q.list();
		return list;
	}
}
