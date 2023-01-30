package com.patinshop.admin.controller;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.patinshop.dao.CustomerDAO;
import com.patinshop.entity.CustomerEntity;
import com.patinshop.model.MailInfo;
import com.patinshop.service.CookieService;
import com.patinshop.service.MailService;

@Controller
public class AdminLoginController {

	@Autowired
	CookieService cookie;

	@Autowired
	CustomerDAO cusDao;

	@Autowired
	HttpSession session;

	@Autowired
	MailService mailer;

	@GetMapping("admin/account/login")
	public String login(ModelMap model) {
		model.addAttribute("ad", new CustomerEntity());
		Cookie cuid = cookie.read("adminId");
		Cookie cpwd = cookie.read("adminPwd");
		if (cuid != null) {
			String uid = cuid.getValue();
			String pass = cpwd.getValue();

			model.addAttribute("aduid", uid);
			model.addAttribute("adpass", pass);
		}
		return "admin/account/login";
	}

	@PostMapping("admin/account/login")
	public String login(@RequestParam("id") String id, @RequestParam("password") String pwd,
			@RequestParam(value = "rmb", required = false) String remember,
			@Validated @ModelAttribute("ad") CustomerEntity cus, BindingResult errors) {

		boolean check = true;
		CustomerEntity user = cusDao.findById(id);
		if (user == null) {
			errors.rejectValue("id", "cus", "Tài khoản không tồn tại!");
			check = false;
		}

		else if (!user.getRole().getName().equals("admin")) {
			errors.rejectValue("id", "cus", "Tài khoản này không phải quản lý!");
			check = false;
		}

		else if (!user.getPassword().equals(pwd)) {
			errors.rejectValue("password", "cus", "Mật khẩu không đúng!");
			check = false;
		} else {
			// login thành công
			// lưu lại thông tin của user trong session
			session.setAttribute("admin", user);

			// ghi nhớ login
			if (remember != null) {
				cookie.create("adminId", user.getId(), 30);
				cookie.create("adminPwd", user.getPassword(), 30);
			} else {
				cookie.delete("adminId");
				cookie.delete("adminPwd");
			}

			String backURL = (String) session.getAttribute("back-url-admin");
			if (backURL != null) {
				session.removeAttribute("back-url-admin");
				return "redirect:" + backURL;
			}
		}
		if (check)
			return "admin/home/index";
		else
			return "admin/account/login";

	}

	@RequestMapping("admin/account/logout")
	public String logout() {
		session.removeAttribute("admin");
		return "redirect:/admin/account/login";
	}

	@GetMapping("admin/account/forgot")
	public String forgot(ModelMap model) {
		model.addAttribute("forgot", new CustomerEntity());
		return "admin/account/forgot";
	}

	@PostMapping("admin/account/forgot")
	public String forgot(ModelMap model, @RequestParam("id") String id, @RequestParam("email") String email,
			@Validated @ModelAttribute("forgot") CustomerEntity cus, BindingResult error) throws MessagingException {

		boolean check = true;

		CustomerEntity user = cusDao.findById(id);
		if (user == null) {
			error.rejectValue("id", "forgot", "Tài khoản không tồn tại!");
			check = false;
		} else if (!user.getEmail().equals(email)) {
			error.rejectValue("email", "forgot", "Email không đúng!");
			check = false;
		} else {
			String from = "tranhoangphi0987@gmail.com";
			String to = cus.getEmail();
			String subject = "Lấy lại mật khẩu";
			String content = "Mật khẩu là:" + user.getPassword();

			MailInfo myMail = new MailInfo(from, to, subject, content);
			mailer.send(myMail);
		}

		if (check)
			return "redirect:/admin/account/login";
		return "admin/account/forgot";
	}
}
