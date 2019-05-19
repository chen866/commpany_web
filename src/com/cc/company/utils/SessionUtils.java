package com.cc.company.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @ClassName 关于session的封装的工具类
 * @Description 对于Session中的操作，封装起来
 */
public class SessionUtils {
	public static HttpSession getSession(HttpServletRequest request) {
		return request.getSession(true);
	}

	/**
	 * 从session中移除User对象
	 * @param request request
	 * @param name key
	 * @param <T> value
	 * @return value
	 */
	@SuppressWarnings("unchecked")
	public static <T> T remove(HttpServletRequest request, String name) {
		HttpSession session = getSession(request);
		try {
			T t = (T) session.getAttribute(name);
			if (t != null) {
				session.removeAttribute(name);
				return t;
			}
		} catch (Exception ignored) {
		}
		return null;
	}

	/**
	 * 从Session中取出对象
	 */
	@SuppressWarnings("unchecked")
	public static <T> T get(HttpServletRequest request, String name, T defaultValue) {
		HttpSession session = getSession(request);
		try {
			T t = (T) session.getAttribute(name);
			if (t != null) {
				return t;
			}
		} catch (Exception ignored) {
		}
		return defaultValue;
	}
	/**
	 * 将对象放入Session
	 */
	public static <T> void set(HttpServletRequest request, String name, T t) {
		HttpSession session = getSession(request);
		try {
			session.setAttribute(name, t);
		} catch (Exception ignored) {
		}
	}
}
