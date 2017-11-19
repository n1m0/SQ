package com.sqfs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.sqfs.beans.ManagerInfo;
import com.sqfs.beans.SqUser;
import com.sqfs.utils.SqfsSessionContext;

/**
 * 登录拦截器，用于拦截用户在操作前判断用户是否已经登录。
 * @author LSZ
 */
public class LoginInterceptor implements HandlerInterceptor {
	
	//后台管理系统登录URL
	private static final String REQUEST_URL_MANAGE = "/sq/backStage/m";	
	//交易/信息URL
	private static final String REQUEST_URL_TRANS = "/sq/trans";
	//存放在session中的管理员信息
	private static final String MANAGER_IN_SESSION = "MANAGER_IN_SESSION";
	//在完善个人信息及资产时要登录
	private static final String personal="/sq/loan";
	private static final String invest="/sq/invest/investList";
	//存放在session中的客户信息
	private static final String CUSTOMER_IN_SESSION = "info";	
	
	/**
	 * 拦截用户访问路径，判断用户的是否能访问该路径
	 */
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		//获取访问URL
		String uri = request.getRequestURI();
		//如果用户执行交易动作获取进入后台管理系统需要判断用户是否已经登录系统
		if(uri.contains(REQUEST_URL_MANAGE) || uri.contains(REQUEST_URL_TRANS)) {
			//访问后台管理系统
			if(uri.contains(REQUEST_URL_MANAGE)) {
				ManagerInfo root = (ManagerInfo) SqfsSessionContext.pop(MANAGER_IN_SESSION);
				if(root == null) {
					//重定向到后台登录系统
					String path = request.getContextPath();
					response.sendRedirect(path + "/backStage");
					return false;
				} else {
					//放行
					return true;
				}
			}			
			//执行交易动作
			if(uri.contains(REQUEST_URL_TRANS)||uri.contains(personal)||uri.contains(invest)) {
				SqUser customer = (SqUser) SqfsSessionContext.pop(CUSTOMER_IN_SESSION);
				if(customer == null) {
					//重定向到后台登录系统
					String path = request.getContextPath();
					response.sendRedirect(path + "/login/home");
					return false;
				} else {
					//放行
					return true;
				}
			}
		} else {
			//如果用户只是浏览产品等，则直接放行
			return true;
		}
		return true;
		
	}

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {	
		
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
