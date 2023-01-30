package com.patinshop.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.patinshop.dao.ProductDAO;
import com.patinshop.entity.ProductEntity;
import com.patinshop.model.CartItem;

@Service
@SessionScope
public class CartService {
	
	@Autowired
	ProductDAO prodDao;
	
	Map<String, CartItem> map = new HashMap<>();

	public void add(String id, int prodSize) {
		CartItem item = map.get(id);
		
		//nếu chưa có trong giỏ hàng thì thêm mới
		if(item == null) {
			item = new CartItem();
			ProductEntity p = prodDao.findById(id);
			item.setProduct(p);
			item.setProdSize(prodSize);
			item.setQuantity(1);
			map.put(p.getId(), item);
		}
		else item.setQuantity(item.getQuantity() + 1);
		
	}

	public void updateQty(String id, int qty) {
		map.get(id).setQuantity(qty);
	}
	
	public void updateSize(String id, int size) {
		map.get(id).setProdSize(size);
	}

	public void delete(String id) {
		map.remove(id);
	}

	public void clear() {
		map.clear();
	}

	public int getCount() {
		Collection<CartItem> list = this.getItems();
		int count = 0;
		for(CartItem item : list) {
			count += item.getQuantity();
		}
		return count;
	}

	public double getTotal() {
		Collection<CartItem> list = this.getItems();
		double total = 0;
		for (CartItem item : list) {
			ProductEntity prod = item.getProduct();
			if (prod.getDiscount() != null) {
				total += prod.getDiscount() * item.getQuantity();
			} else
				total += prod.getPrice() * item.getQuantity();
		}
		return total;
	}

	public Collection<CartItem> getItems() {
		return map.values();
	}
}
