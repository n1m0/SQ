package com.sqfs.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * SessionContext 工具类,用于数据存储到session和从session中获取数据
 * @author LSZ
 */
public final class SqfsSessionContext {
	
	private SqfsSessionContext() {}
	
	/**
	 * 把数据存储到session中
	 * @param objName 存储到session中的对象的变量名
	 * @param o 存储的任意数据
	 */
	public static void push(String objName, Object o) {
		HttpServletRequest request = 
				((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().setAttribute(objName, o);
	}
	
	/**
	 * 从session中获取数据
	 * @param objName 存储到session中的对象的变量名
	 */
	public static Object pop(String objName) {
		HttpServletRequest request = 
				((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return request.getSession().getAttribute(objName);
	}
	
	/**
	 * 从session中删除数据
	 * @param key 指定要删除的数据
	 */
	public static void remove(String key) {
		HttpServletRequest request = 
				((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().removeAttribute(key);
	}
}
