package com.patinshop.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.patinshop.dao.CustomerDAO;
import com.patinshop.dao.OrderDAO;
import com.patinshop.dao.OrderDetailDAO;
import com.patinshop.entity.CustomerEntity;
import com.patinshop.entity.OrderDetailEntity;
import com.patinshop.entity.OrderEntity;
import com.patinshop.entity.ProductEntity;
import com.patinshop.model.CartItem;
import com.patinshop.service.CartService;

@Controller
public class OrderController {

	@Autowired
	HttpSession session;
	
	@Autowired
	CartService cart;
	
	@Autowired
	OrderDAO orderDao;
	
	@Autowired
	OrderDetailDAO orderDetailDao;
	
	@Autowired
	CustomerDAO cusDao;

	@GetMapping("/order/checkout")
	public String showForm(ModelMap model) {

		CustomerEntity cus = (CustomerEntity) session.getAttribute("user");
		OrderEntity order = new OrderEntity();
		if(cus != null) {
			order.setDate(new Date());
			order.setUser(cus);
			order.setTotalMoney(cart.getTotal());
			order.setStatus(false); // admin chưa xác nhận đơn hàng
		}
		else {
			order.setUser(new CustomerEntity());
		}
		
		if(cart.getItems().isEmpty())
			return "redirect:/product/all";
			
		model.addAttribute("order", order);
		return "order/checkout";
	}

	@PostMapping("/order/checkout")
	public String checkout(ModelMap model,
			@RequestParam("user.fname")String fname, @RequestParam("user.lname")String lname,
			@Validated @ModelAttribute("order") OrderEntity order, BindingResult error) {
		
		Collection<CartItem> items = cart.getItems();
		List<OrderDetailEntity> details = new ArrayList<>();
		for(CartItem item : items) {
			
			OrderDetailEntity detail  = new OrderDetailEntity();
			
			detail.setOrder(order);
			detail.setProduct(item.getProduct());
			detail.setProd_size(item.getProdSize());
			detail.setQuantity(item.getQuantity());
			
			if(item.getProduct().getDiscount() != null) {
				detail.setPrice(item.getProduct().getDiscount());
				detail.setTotalMoney(item.getProduct().getDiscount() * item.getQuantity());
			}
			else {
				detail.setPrice(item.getProduct().getPrice());
				detail.setTotalMoney(item.getProduct().getPrice() * item.getQuantity());
			}
			
			details.add(detail);		
		}
		
		if(error.hasErrors()) {
			return "order/checkout";
		}
		order.setFullname(fname.trim() + " " + lname.trim());
		orderDao.create(order, details);
		
		// cập nhật thông tin các orders của user đó lại vào trong session
		CustomerEntity cus  = cusDao.findById(order.getUser().getId());
		session.setAttribute("user", cus);
		
		cart.clear();
		return "redirect:/order/list";
	}
	
	@GetMapping("order/list")
	public String orders(ModelMap model) {
		CustomerEntity cus = (CustomerEntity) session.getAttribute("user");
		List<OrderEntity> orders = cus.getOrders();
		Collections.sort(orders, (a, b) -> b.getId().compareTo(a.getId()));
		model.addAttribute("orders", orders);
		return "order/list";
	}
	
	@GetMapping("order/detail/{id}")
	public String detail(@PathVariable("id") Integer id, ModelMap model) {
		OrderEntity order = orderDao.findById(id);
		List<OrderDetailEntity> list = orderDetailDao.findById(id);
		model.addAttribute("order", order);
		model.addAttribute("detail", list);
		return "order/detail";
	}
	
//	@GetMapping("order/bought-items")
//	public String items(ModelMap model) {
//		CustomerEntity cus = (CustomerEntity) session.getAttribute("user");
//		List<ProductEntity> list = cusDao.findItemsByUser(cus);
//		model.addAttribute("prods", list);
//		return "product/list";
//	}
}
