package com.patinshop.service;

import java.util.Base64;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieService {

	@Autowired
	HttpServletRequest req;

	@Autowired
	HttpServletResponse resp;

	public Cookie create(String name, String value, int days) {
		String encodedValue = Base64.getEncoder().encodeToString(value.getBytes());
		Cookie cookie = new Cookie(name, encodedValue);
		cookie.setMaxAge(days * 24 * 60 * 60); // in seconds
		cookie.setPath("/");
		resp.addCookie(cookie);
		return cookie;
	}
	
	public Cookie create(String name, String value, int days, HttpServletResponse resp) {
		String encodedValue = Base64.getEncoder().encodeToString(value.getBytes());
		Cookie cookie = new Cookie(name, encodedValue);
		cookie.setMaxAge(days * 24 * 60 * 60); // in seconds
		cookie.setPath("/");
		resp.addCookie(cookie);
		return cookie;
	}

	public Cookie read(String name) {
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equalsIgnoreCase(name)) {
					String decodedValue = new String(Base64.getDecoder().decode(c.getValue()));
					c.setValue(decodedValue);
					return c;
				}
			}
		}
		return null;
	}
	
	public Cookie read(String name, HttpServletRequest req) {
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equalsIgnoreCase(name)) {
					String decodedValue = new String(Base64.getDecoder().decode(c.getValue()));
					c.setValue(decodedValue);
					return c;
				}
			}
		}
		return null;
	}

	public void delete(String name) {
		this.create(name, "", 0);
	}
}
