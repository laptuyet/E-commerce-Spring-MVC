package com.patinshop.interceptor;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import com.patinshop.entity.CustomerEntity;

@Component
public class AuthorizeInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {

		String backURL = request.getRequestURI();
		backURL = backURL.replace(request.getContextPath(), ""); // bỏ cái contextPath đi
		HttpSession session = request.getSession();
		CustomerEntity admin, user;
		
		if(backURL.contains("admin")) {
			admin = (CustomerEntity) session.getAttribute("admin");
			if(admin == null) {
				session.setAttribute("back-url-admin", backURL);
				response.sendRedirect(request.getContextPath() + "/admin/account/login");
				return false;
			}
			
		}
		else {
			user = (CustomerEntity) session.getAttribute("user");
			if(user == null) {
				session.setAttribute("back-url", backURL);
				response.sendRedirect(request.getContextPath() + "/account/login");
				return false;
			}
		}

		return true;
	}
}
