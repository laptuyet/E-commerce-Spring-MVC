package com.patinshop.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.patinshop.dao.CustomerDAO;
import com.patinshop.entity.CustomerEntity;

@Controller
public class CustomerManager {

	@Autowired
	CustomerDAO cusDao;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	HttpSession session;
	
	PagedListHolder<CustomerEntity> cusPageList;

	@RequestMapping("admin/customer/index")
	public String index() {
		cusPageList = new PagedListHolder<CustomerEntity>();
		cusPageList.setSource(cusDao.findAll());
		cusPageList.setPageSize(4);
		session.setAttribute("cusList", cusPageList);
		return "admin/customer/index";
	}

	@RequestMapping("admin/customer/addnew")
	public String add(ModelMap model) {
		model.addAttribute("option", "addnew");
		CustomerEntity cus = new CustomerEntity();
		cus.setPassword("123456"); // set pass mặc định
		model.addAttribute("cus", cus);
		return "admin/customer/form";
	}

	@RequestMapping("admin/customer/create")
	public String create(ModelMap model, @Validated @ModelAttribute("cus") CustomerEntity cus, BindingResult error) {

		CustomerEntity user = cusDao.findById(cus.getId());
		if (user != null) {
			error.rejectValue("id", "cus", "Tài khoản đã tồn tại!");
		}

		if (error.hasErrors()) {
			model.addAttribute("msgErr", "Có lỗi xảy ra!");
			model.addAttribute("option", "addnew");
			return "admin/customer/form";

		}
		cus = cusDao.create(cus);
		model.addAttribute("option", "addnew");
		model.addAttribute("msgSucc", "Thêm khách hàng thành công!");
		model.addAttribute("highlighted", cus.getId());
		cusPageList.setSource(cusDao.findAll());
		cusPageList.setPage(cusPageList.getPageCount() - 1); // chạy về page cuối
		return "admin/customer/index";
	}

	@RequestMapping("admin/customer/edit/{cid}")
	public String edit(ModelMap model, @PathVariable("cid") String cid) {
		CustomerEntity cus = cusDao.findById(cid);
		model.addAttribute("cus", cus);
		model.addAttribute("option", "edit");
		return "admin/customer/form";
	}

	@RequestMapping("admin/customer/update")
	public String update(ModelMap model, @Validated@ModelAttribute("cus") CustomerEntity cus, BindingResult error,
						@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		
		if(!file.isEmpty()) {
			String dir = context.getRealPath("/resources/assets/images/customers/") + file.getOriginalFilename();
			File f = new File(dir);
			if(!f.exists()) {
				f.mkdir();
			}
			file.transferTo(f);
			cus.setPhoto(f.getName());
		}
		
		if(error.hasErrors()) {
			model.addAttribute("option", "edit");
			return "admin/customer/form";
		}
		
		cusDao.update(cus);
		model.addAttribute("msgSucc", "Cập nhật khách hàng thành công!");
		model.addAttribute("highlighted", cus.getId());
		cusPageList.setSource(cusDao.findAll());
		cusPageList.setPage(cusPageList.getPage()); // ở lại page hiện tại
		return "admin/customer/index";
	}

	@RequestMapping(value = { "admin/customer/delete", "admin/customer/delete/{cid}" })
	public String delete(ModelMap model, @RequestParam(value = "id", required = false) String cid1,
			@PathVariable(value = "cid", required = false) String cid2) {
		String cid = (cid1 != null) ? cid1 : cid2;
		
		CustomerEntity cus = cusDao.findById(cid);
		if(!cus.getOrders().isEmpty()) {
			model.addAttribute("msgErr", "Không thể xóa vì khách này đã mua hàng!");
			return "admin/customer/index";
		}
		
		// nếu page hiện tại vẫn còn nhiều hơn 1 item thì ở lưu lại stt của page đó
		// trường hợp còn đúng 1 item tức là đang ở trang cuối r đó
		int currPage = cusPageList.getPageCount() - 1;
		if(cusPageList.getPageList().size() > 1) {
			currPage = cusPageList.getPage();
		}
		
		cusDao.delete(cid);
		model.addAttribute("msgSucc", "Xóa danh khách hàng thành công!");
		cusPageList.setSource(cusDao.findAll());
		cusPageList.setPage(currPage);
		return "admin/customer/index";
	}
	
	@RequestMapping("admin/customer/page/{page}")
	public String page(@PathVariable(value = "page", required = false) String page) {
		if (page.equals("prev")) {
			cusPageList.previousPage();
		} else if (page.equals("next")) {
			cusPageList.nextPage();
		} else {
			int pageNum = Integer.parseInt(page);
			cusPageList.setPage(pageNum - 1);
		}
		return "admin/customer/index";
	}
}
