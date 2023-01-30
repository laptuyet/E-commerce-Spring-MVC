package com.patinshop.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import com.patinshop.dao.CustomerDAO;
import com.patinshop.entity.CustomerEntity;
import com.patinshop.model.MailInfo;
import com.patinshop.service.CookieService;
import com.patinshop.service.MailService;

@Controller
public class AccountController {

	@Autowired
	CustomerDAO cusDao;

	@Autowired
	HttpSession session;

	@Autowired
	CookieService cookie;

	@Autowired
	ServletContext context;

	@Autowired
	HttpServletRequest req;

	@Autowired
	MailService mailer;

	@GetMapping("/account/login")
	public String login(ModelMap model) {
		model.addAttribute("cus", new CustomerEntity());
		Cookie cuid = cookie.read("userid");
		Cookie cpwd = cookie.read("pwd");
		if (cuid != null) {
			String uid = cuid.getValue();
			String pass = cpwd.getValue();

			model.addAttribute("uid", uid);
			model.addAttribute("pass", pass);
		}

		return "account/login";
	}

	@PostMapping("/account/login")
	public String login(@RequestParam("id") String id, @RequestParam("password") String pwd,
			@RequestParam(value = "rmb", required = false) String remember,
			@Validated @ModelAttribute("cus") CustomerEntity cus, BindingResult errors) {

		boolean check = true;

		CustomerEntity user = cusDao.findById(id);
		if (user == null) {
			errors.rejectValue("id", "cus", "Tài khoản không tồn tại!");
			check = false;
		} else if (!user.getPassword().equals(pwd)) {
			errors.rejectValue("password", "cus", "Mật khẩu không đúng!");
			check = false;
		} else {
			// login thành công
			// lưu lại thông tin của user trong session
			session.setAttribute("user", user);

			// ghi nhớ login
			if (remember != null) {
				cookie.create("userid", user.getId(), 30);
				cookie.create("pwd", user.getPassword(), 30);
			} else {
				cookie.delete("userid");
				cookie.delete("pwd");
			}

			String backURL = (String) session.getAttribute("back-url");
			if (backURL != null) {
				session.removeAttribute("back-url");
				return "redirect:" + backURL;
			}
		}
		if (check)
			return "home/index";
		else
			return "account/login";
	}

	@RequestMapping("/account/logout")
	public String logout() {
		session.removeAttribute("user");
		return "redirect:/account/login";
	}

	@GetMapping("/account/register")
	public String register(ModelMap model) {
		model.addAttribute("register", new CustomerEntity());
		return "account/register";
	}

	@PostMapping("/account/register")
	public String register(ModelMap model, @Validated @ModelAttribute("register") CustomerEntity cus,
			BindingResult errors, @RequestParam("repassword") String repass,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {

		if (file.isEmpty()) {
			cus.setPhoto("user.jpg");
		} else {

			String dir = context.getRealPath("/resources/assets/images/customers/" + file.getOriginalFilename());
			File f = new File(dir);
			if (!f.exists()) {
				f.mkdir();
			}
			file.transferTo(f);
			cus.setPhoto(f.getName());
		}

		boolean check = true;

		CustomerEntity user = cusDao.findById(cus.getId());

		if (user != null) {
			errors.rejectValue("id", "register", "Tài khoản đã tồn tại!");
			check = false;
		}

		if (!repass.equals(cus.getPassword())) {
			model.addAttribute("repass", "Mật khẩu không khớp");
			check = false;
		}

		if (errors.hasErrors() || check == false) {
			model.addAttribute("msg", "Đăng ký không thành công!");
			return "account/register";
		} else {
			model.addAttribute("msg", "Đăng ký thành công!");
			cusDao.create(cus);
			return "redirect:/account/login";
		}
	}

	@GetMapping("/account/forgot")
	public String forgot(ModelMap model) {
		model.addAttribute("forgot", new CustomerEntity());
		return "account/forgot";
	}

	@PostMapping("/account/forgot")
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
			return "redirect:/account/login";
		return "account/forgot";
	}

	@GetMapping("/account/edit")
	public String edit(ModelMap model) {
		CustomerEntity user = (CustomerEntity) session.getAttribute("user");
		String dir = context.getRealPath("/resources/assets/images/customers/" + user.getPhoto());
		model.addAttribute("dir", dir);
		model.addAttribute("edit", user);
		return "account/edit";
	}

	@PostMapping("/account/edit")
	public String edit(ModelMap model, @Validated @ModelAttribute("edit") CustomerEntity cus, BindingResult errors,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		String fileName = file.getOriginalFilename();
		if (!file.isEmpty()) {
			String dir = context.getRealPath("/resources/assets/images/customers/" + fileName);
			File f = new File(dir);
			if (!f.exists()) {
				f.mkdir();
			}
			file.transferTo(f);
			cus.setPhoto(fileName);
		}

		if (errors.hasErrors()) {
			model.addAttribute("msg", "Lưu thông tin thất bại!");
		} else {
			cusDao.update(cus);
			session.setAttribute("user", cus);
			model.addAttribute("msg", "Lưu thông tin thành công!");
		}
		return "account/edit";
	}

	@GetMapping("account/change")
	public String change(ModelMap model) {
		model.addAttribute("change", new CustomerEntity());
		return "account/change";
	}

	@PostMapping("account/change")
	public String change(ModelMap model, @Validated @ModelAttribute("change") CustomerEntity user, BindingResult error,
			@RequestParam("id") String id, @RequestParam("password") String pwd, @RequestParam("pwd1") String pwd1,
			@RequestParam("pwd2") String pwd2) {

		boolean check = true;

		CustomerEntity cus = cusDao.findById(id);
		if (cus == null) {
			error.rejectValue("id", "change", "Tài khoản không tồn tại!");
			check = false;
		} else if (!pwd.equals(cus.getPassword())) {
			error.rejectValue("password", "change", "Mật khẩu cũ không đúng!");
			check = false;
		} else if (pwd1.equals("")) {
			model.addAttribute("passwrong1", "Mật khẩu mới trống!");
			check = false;
		} else if (pwd2.equals("")) {
			model.addAttribute("passwrong2", "Mật khẩu mới trống!");
			check = false;
		} else if (!pwd1.equals(pwd2)) {
			model.addAttribute("passwrong2", "Nhập lại mật khẩu mới không khớp!");
			check = false;
		}

		if (check) {
			cus.setPassword(pwd1);
			cusDao.update(cus);
			model.addAttribute("msg", "Đổi mật khẩu thành công!");
			return "redirect:/account/login";
		}

		return "account/change";
	}

}
