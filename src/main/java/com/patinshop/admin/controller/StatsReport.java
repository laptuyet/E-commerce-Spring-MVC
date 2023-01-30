package com.patinshop.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.patinshop.dao.CategoryDAO;
import com.patinshop.dao.CustomerDAO;
import com.patinshop.dao.ReportDAO;
import com.patinshop.entity.CategoryEntity;

@Controller
public class StatsReport {
	
	@Autowired
	ReportDAO report;
	
	@Autowired
	CategoryDAO cateDao;
	
	@Autowired
	CustomerDAO cusDao;
	
	@RequestMapping("admin/report/index")
	public String index() {
		
		return "admin/report/index";
	}
	
	@RequestMapping("admin/report/revenue-by-category")
	public String byCate(ModelMap model) {
		
		List<CategoryEntity> cateList = cateDao.findAll();
		
		List<Object[]> list = report.revenueByCategory();
		
		Map<String, Double> dataChart = new HashMap<>();

		for(CategoryEntity c : cateList) {
			dataChart.put(c.getName(), 0d);
		}
		
		for(Object[] o : list ) {
			if(dataChart.containsKey(o[0].toString())) {
				dataChart.put(o[0].toString(), Double.valueOf(o[2].toString()));
			}
		}
		
		model.addAttribute("tableList", list);
		model.addAttribute("list", dataChart);
		return "admin/report/_revenue-by-category";
	}
	
	@RequestMapping("admin/report/revenue-by-customer")
	public String byCus(ModelMap model) {
		List<Object[]> list = report.revenueByCustomer();
		model.addAttribute("tableList", list);
		return "admin/report/_revenue-by-customer";
	}
	
}
