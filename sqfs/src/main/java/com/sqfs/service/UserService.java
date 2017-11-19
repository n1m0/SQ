package com.sqfs.service;

import com.sqfs.beans.SqUser;

public interface UserService {

	public SqUser login(SqUser sqUser);//用户登录
	
	
	public SqUser YZphone(String phone);//验证手机是否注册过
	
	public int register(SqUser sqUser);//手机注册
	
	public int alterPassword(SqUser sqUser);//修改密码
	
	
}
