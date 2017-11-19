package com.sqfs.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqfs.beans.SqUser;
import com.sqfs.mapper.UserMapper;
import com.sqfs.service.UserService;
import com.sqfs.utils.PasswordEncoderHandler;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	//登录密码加密,加入特殊字符
	public SqUser login(SqUser sqUser) {
		sqUser.setD_pwd(PasswordEncoderHandler.getMD5(sqUser.getD_pwd()+"SQ金服"));
		return userMapper.login(sqUser);
	}

	//验证手机是否注册过
	public SqUser YZphone(String phone) {
		

		return userMapper.YZphone(phone);
	}


	//注册
	public int register(SqUser sqUser) {
		sqUser.setD_pwd(PasswordEncoderHandler.getMD5(sqUser.getD_pwd()+"SQ金服"));
		return userMapper.register(sqUser);
	}
	//修改密码
	public int alterPassword(SqUser sqUser) {
		
		sqUser.setD_pwd(PasswordEncoderHandler.getMD5(sqUser.getD_pwd()+"SQ金服"));
		
		return userMapper.alterPassword(sqUser);
	}


}
