package com.patinshop.admin.controller;

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

import com.patinshop.dao.CategoryDAO;
import com.patinshop.entity.CategoryEntity;

@Controller
public class CategoryManager {
	
	@Autowired
	CategoryDAO cateDao;
	
	@Autowired
	HttpSession session;
	
	PagedListHolder<CategoryEntity> catePageList;
	
	@RequestMapping("admin/category/index")
	public String index() {
		catePageList = new PagedListHolder<CategoryEntity>();
		catePageList.setSource(cateDao.findAll());
		catePageList.setPageSize(4);
		session.setAttribute("cateList", catePageList);
		return "admin/category/index";
	}
	
	@RequestMapping("admin/category/addnew")
	public String addNew(ModelMap model) {
		model.addAttribute("option", "addnew");
		model.addAttribute("cate", new CategoryEntity());
		return "admin/category/form";
	}
	
	@RequestMapping("admin/category/create")
	public String create(ModelMap model, @Validated @ModelAttribute("cate") CategoryEntity cate, BindingResult error) {
		
		if(error.hasErrors()) {
			model.addAttribute("option", "addnew");
			return "admin/category/form";
		} else if (cateDao.isExisted(cate.getName().trim())) {
			error.rejectValue("name", "cate", "Tên danh mục đã tồn tại!");
			model.addAttribute("option", "addnew");
			return "admin/category/form";
		}
		cate = cateDao.create(cate);
		model.addAttribute("option", "addnew");
		model.addAttribute("msgSucc", "Thêm danh mục thành công!");
		model.addAttribute("highlighted", cate.getId());
		catePageList.setSource(cateDao.findAll());
		catePageList.setPage(catePageList.getPageCount() - 1); // chạy về page cuối
		
		return "admin/category/index";
	}
	
	@RequestMapping("admin/category/edit/{cid}")
	public String edit(ModelMap model, @PathVariable("cid") Integer cid) {
		CategoryEntity cate = cateDao.findById(cid);
		model.addAttribute("option", "edit");
		model.addAttribute("cate", cate);
		return "admin/category/form";
	}
	
	@RequestMapping("admin/category/update")
	public String update(ModelMap model, @Validated@ModelAttribute("cate") CategoryEntity cate, BindingResult error) {
		
		if(error.hasErrors()) {
			model.addAttribute("option", "edit");
			return "admin/category/form"; 
		}
		
		if (cateDao.isExisted(cate.getName().trim())) {
			error.rejectValue("name", "cate", "Tên danh mục đã tồn tại!");
			model.addAttribute("option", "edit");
			return "admin/category/form";
		}
		
		cateDao.update(cate);
		model.addAttribute("msgSucc", "Cập nhật danh mục thành công!");
		model.addAttribute("highlighted", cate.getId());
		catePageList.setSource(cateDao.findAll());
		catePageList.setPage(catePageList.getPage()); // ở lại page hiện tại
		return "admin/category/index";
	}
	
	@RequestMapping(value = {"admin/category/delete", "admin/category/delete/{cid}"})
	public String delete(ModelMap model,
			@PathVariable(value = "cid", required = false) Integer cid) {
		CategoryEntity cate = cateDao.findById(cid);
		if(!cate.getProducts().isEmpty()) {
			model.addAttribute("msgErr", "Không thể xóa vì danh mục này đã có sản phẩm!");
			return "admin/category/index";
		}
		
		// nếu page hiện tại vẫn còn nhiều hơn 1 item thì ở lưu lại stt của page đó
		// trường hợp còn đúng 1 item tức là đang ở trang cuối r đó
		int currPage = catePageList.getPageCount() - 1;
		if(catePageList.getPageList().size() > 1) {
			currPage = catePageList.getPage();
		}
		
		cateDao.delete(cid);
		model.addAttribute("msgSucc", "Xóa danh mục thành công!");
		catePageList.setSource(cateDao.findAll());
		catePageList.setPage(currPage);
		return "admin/category/index";
	}
	
	@RequestMapping("admin/category/page/{page}")
	public String page(@PathVariable(value = "page", required = false) String page) {
		if (page.equals("prev")) {
			catePageList.previousPage();
		} else if (page.equals("next")) {
			catePageList.nextPage();
		} else {
			int pageNum = Integer.parseInt(page);
			catePageList.setPage(pageNum - 1);
		}
		return "admin/category/index";
	}
}
