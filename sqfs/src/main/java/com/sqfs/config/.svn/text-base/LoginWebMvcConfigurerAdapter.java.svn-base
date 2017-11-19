package com.sqfs.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.sqfs.interceptor.LoginInterceptor;

/**
 * 配置登录拦截器。
 * @author LSZ
 */
@Configuration
public class LoginWebMvcConfigurerAdapter extends WebMvcConfigurerAdapter {

	/**
	 * 注入自定义拦截器
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//拦截所有的请求
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/**");
	}
}
