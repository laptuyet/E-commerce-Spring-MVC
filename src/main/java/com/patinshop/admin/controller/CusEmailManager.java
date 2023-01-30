package com.patinshop.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.patinshop.dao.CusEmailsDAO;
import com.patinshop.entity.CategoryEntity;
import com.patinshop.entity.CusEmailsEntity;

@Controller
public class CusEmailManager {
	
	@Autowired
	CusEmailsDAO emails;
	
	@Autowired
	HttpSession session;
	
	PagedListHolder<CusEmailsEntity> emailPageList;

	@RequestMapping("admin/other/cus-email")
	public String emails() {
		
		emailPageList = new PagedListHolder<CusEmailsEntity>();
		emailPageList.setSource(emails.findAll());
		emailPageList.setPageSize(4);
		session.setAttribute("emailList", emailPageList);
		
		return "admin/other/index";
	}
	
	@RequestMapping(value = {"admin/other/delete", "admin/other/delete/{cid}"})
	public String delete(ModelMap model,
			@PathVariable(value = "cid", required = false) Integer cid) {
		CusEmailsEntity email = emails.findById(cid);
		
		// nếu page hiện tại vẫn còn nhiều hơn 1 item thì ở lưu lại stt của page đó
		// trường hợp còn đúng 1 item tức là đang ở trang cuối r đó
		int currPage = emailPageList.getPageCount() - 1;
		if(emailPageList.getPageList().size() > 1) {
			currPage = emailPageList.getPage();
		}
		
		emails.delete(cid);
		model.addAttribute("msgSucc", "Xóa email thành công!");
		emailPageList.setSource(emails.findAll());
		emailPageList.setPage(currPage);
		return "admin/other/index";
	}
	
	@RequestMapping("admin/other/page/{page}")
	public String page(@PathVariable(value = "page", required = false) String page) {
		if (page.equals("prev")) {
			emailPageList.previousPage();
		} else if (page.equals("next")) {
			emailPageList.nextPage();
		} else {
			int pageNum = Integer.parseInt(page);
			emailPageList.setPage(pageNum - 1);
		}
		return "admin/other/index";
	}
}
