package com.patinshop.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.patinshop.dao.ImageDAO;
import com.patinshop.entity.ImageEntity;

@Transactional
@Repository
public class ImageDAOImpl implements ImageDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public ImageEntity findById(Integer id) {
		Session session = factory.getCurrentSession();
		ImageEntity image = (ImageEntity) session.get(ImageEntity.class, id);
		return image;
	}

	@Override
	public List<ImageEntity> findAll() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ImageEntity";
		Query query = session.createQuery(hql);
		List<ImageEntity> images = query.list();
		return images;
	}

	@Override
	public ImageEntity create(ImageEntity image) {
		Session session = factory.getCurrentSession();
		session.save(image);
		return image;
	}

	@Override
	public void update(ImageEntity image) {
		Session session = factory.getCurrentSession();
		session.update(image);
	}

	@Override
	public void delete(Integer id) {
		Session session = factory.getCurrentSession();
		ImageEntity image = (ImageEntity)session.get(ImageEntity.class, id);
		session.delete(image);
	}
}
