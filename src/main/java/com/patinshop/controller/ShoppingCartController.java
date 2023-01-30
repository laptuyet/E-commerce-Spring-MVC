package com.patinshop.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.patinshop.dao.ProductDAO;
import com.patinshop.entity.ProductSizeEntity;
import com.patinshop.service.CartService;

@Controller
public class ShoppingCartController {
	
	@Autowired
	CartService cart;
	
	@Autowired
	ProductDAO prodDao;
	
	@RequestMapping(value = "/product/add-to-cart/{pid}", produces="application/json")
	@ResponseBody
	public String addToCart(@PathVariable("pid") String pid) {
		List<ProductSizeEntity> sizes = prodDao.findById(pid).getProductSize();
		int size = sizes.get(0).getSize().getSizeNum();
		cart.add(pid, size);
		
		JSONObject info = new JSONObject();
		info.put("count", cart.getCount());
		info.put("total", cart.getTotal());
		return info.toString();
	}
	
	@RequestMapping(value = "/product/add-to-cart/{pid}/{size}", produces="application/json")
	@ResponseBody
	public String addToCart(@PathVariable("pid") String pid, @PathVariable("size") int size) {
		cart.add(pid, size);
		
		JSONObject info = new JSONObject();
		info.put("count", cart.getCount());
		info.put("total", cart.getTotal());
		return info.toString();
	}
	
	@RequestMapping("/cart/view-detail")
	public String cartView() {
		return "cart/view";
	}
	
	@RequestMapping(value = "/cart/remove/{pid}", produces="application/json")
	@ResponseBody
	public String clear(@PathVariable("pid") String pid) {
		cart.delete(pid);
		JSONObject info = new JSONObject();
		info.put("count", cart.getCount());
		info.put("total", cart.getTotal());
		return info.toString();
	}
	
	@RequestMapping(value = "/cart/update-qty/{pid}/{qty}", produces="application/json")
	@ResponseBody
	public String qtyChange(@PathVariable("pid") String pid, @PathVariable("qty") int qty) {
		if(qty == 0) {
			cart.delete(pid);
		} else {
			cart.updateQty(pid, qty);
		}
		
		JSONObject info = new JSONObject();
		info.put("count", cart.getCount());
		info.put("total", cart.getTotal());
		return info.toString();
	}
	
	@RequestMapping(value = "/cart/update-size/{pid}/{size}", produces="application/json")
	@ResponseBody
	public void sizeChange(@PathVariable("pid") String pid, @PathVariable("size") String size) {
		int sizeNum = Integer.parseInt(size);
		cart.updateSize(pid, sizeNum);
	}
	
	@RequestMapping("/cart/clear")
	@ResponseBody
	public void clear() {
		cart.clear();
	}
}
