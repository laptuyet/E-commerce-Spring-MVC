package com.patinshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Transactional
@Controller
public class HomeController {

	@RequestMapping(value = {"/", "/home/index", "/trang-chu/index" })
	public String index() {
		return "home/index";
	}

	@RequestMapping("home/language")
	@ResponseBody
	public void language() {
	}

}
