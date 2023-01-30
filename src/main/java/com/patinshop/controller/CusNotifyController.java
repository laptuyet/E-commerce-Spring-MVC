package com.patinshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.patinshop.dao.CusEmailsDAO;
import com.patinshop.entity.CusEmailsEntity;

@Controller
public class CusNotifyController {

	@Autowired
	CusEmailsDAO cusEmailDao;

	@RequestMapping("cus/notify/{email}")
	@ResponseBody
	public String add(@PathVariable("email") String cusEmail, ModelMap model) {
		/*
		 * if(cusEmail.equals("")) { model.addAttribute("cusEmailErr", "Email trống!");
		 * return "empty"; return "home/index"; }
		 */

		if (!cusEmail.matches("[A-Za-z0-9._]+@[A-Za-z0-9._]+\\.[A-Za-z]{2,6}")) {
			model.addAttribute("cusEmailErr", "Email không đúng định dạng!");
			return "invalid";
			/* return "home/index"; */
		}

		if (cusEmailDao.isExisted(cusEmail)) {
			model.addAttribute("cusEmailErr", "Email đã đăng ký rồi!");
			return "existed";
			/* return "home/index"; */
		}

		CusEmailsEntity email = new CusEmailsEntity();
		email.setEmail(cusEmail);
		cusEmailDao.create(email);
		model.addAttribute("cusEmailSuccess", "Đăng ký nhận thông báo thành công!");
		/* return "home/index"; */
		return "success";
	}
}
