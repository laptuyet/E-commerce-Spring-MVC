package com.patinshop.admin.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.patinshop.dao.OrderDAO;
import com.patinshop.dao.OrderDetailDAO;
import com.patinshop.entity.OrderEntity;
import com.patinshop.entity.OrderEntity;

@Controller
public class OrderManager {
	
	@Autowired
	OrderDAO orderDao;
	
	@Autowired
	OrderDetailDAO orderDetailDao;
	
	@Autowired
	HttpSession session;
	
	PagedListHolder<OrderEntity> orderPageList;
	
	@RequestMapping("admin/order/index")
	public String index() {
		orderPageList = new PagedListHolder<OrderEntity>();
		List<OrderEntity> orders = orderDao.findAll();
		Collections.sort(orders, (a, b) -> b.getId().compareTo(a.getId()));
		orderPageList.setSource(orders);
		orderPageList.setPageSize(4);
		session.setAttribute("orderList", orderPageList);
		return "admin/order/index";
	}
	
	@RequestMapping("admin/order/edit/{oid}")
	public String edit(ModelMap model, @PathVariable("oid") Integer oid) {
		model.addAttribute("option", "edit");
		model.addAttribute("details", orderDetailDao.findById(oid));
		model.addAttribute("order", orderDao.findById(oid));
		return "admin/order/form";
	}
	
	@RequestMapping("admin/order/update")
	public String update(ModelMap model, @ModelAttribute("order") OrderEntity order) {
		orderDao.update(order);
		model.addAttribute("msgSucc", "Cập nhật đơn hàng thành công!");
		model.addAttribute("highlighted", order.getId());
		orderPageList.setSource(orderDao.findAll());
		orderPageList.setPage(orderPageList.getPage()); // ở lại page hiện tại
		return "admin/order/index";
	}
	
	/*
	 * @RequestMapping(value = {"admin/order/delete", "admin/order/delete/{cid}"})
	 * public String delete(RedirectAttributes model,
	 * 
	 * @RequestParam(value = "id", required = false) Integer cid1,
	 * 
	 * @PathVariable(value = "cid", required = false) Integer cid2) { Integer cid =
	 * (cid1 != null) ? cid1 : cid2; orderDao.delete(cid);
	 * model.addAttribute("msgSucc", "Xóa đơn hàng đơn hàng thành công!"); return
	 * "redirect:/admin/order/index"; }
	 */
	
	@RequestMapping("admin/order/page/{page}")
	public String page(@PathVariable(value = "page", required = false) String page) {
		if (page.equals("prev")) {
			orderPageList.previousPage();
		} else if (page.equals("next")) {
			orderPageList.nextPage();
		} else {
			int pageNum = Integer.parseInt(page);
			orderPageList.setPage(pageNum - 1);
		}
		return "admin/order/index";
	}
}
