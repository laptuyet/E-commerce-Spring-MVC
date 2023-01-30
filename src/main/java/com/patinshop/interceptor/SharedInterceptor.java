package com.patinshop.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.patinshop.dao.CategoryDAO;
import com.patinshop.dao.RoleDAO;
import com.patinshop.entity.CategoryEntity;
import com.patinshop.entity.RoleEntity;

@Component
public class SharedInterceptor implements HandlerInterceptor{
	
	@Autowired
	CategoryDAO cateDao;
	
	@Autowired
	RoleDAO roleDao;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		List<CategoryEntity> pCates = cateDao.findAll(false);
		request.setAttribute("prodCates", pCates);
		
		List<CategoryEntity> aCates = cateDao.findAll(true);
		request.setAttribute("acsCates", aCates);
		
		List<RoleEntity> roles = roleDao.findAll();
		request.setAttribute("roles", roles);
	}
}
