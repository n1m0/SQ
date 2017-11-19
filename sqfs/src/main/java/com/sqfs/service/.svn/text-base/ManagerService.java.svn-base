package com.sqfs.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.sqfs.beans.ManagerInfo;
import com.sqfs.beans.Role;



/**
 * 后台管理员信息业务处理
 * @author zwl
 * @date 2017年11月9日下午5:09:24
 */

public interface ManagerService {
	

	/**
	 * 登陆业务
	 * @author 曾伟林
	 * @param params
	 * @param resp
	 */
	String login(Map<String, Object> params,HttpServletResponse resp);

	/**
	 * 查询所有管理员
	 * @author 曾伟林
	 */
	List<ManagerInfo> allMan();
	
	/**
	 * 动态查询管理员
	 * @author 曾伟林
	 * @param man
	 */
	List<ManagerInfo> mansDynamic (ManagerInfo man);

	
	/**
	 * 新增管理员
	 * @author 曾伟林
	 * @param man
	 */
	String addMan(ManagerInfo man);
	
	/**
	 * 修改当前用户密码
	 * @author 曾伟林
	 * @param manId
	 * @return Integer
	 */
	String updatePword(String nPword,String manId,HttpSession session);
	
	/**
	 * 角色信息查询
	 * @author 曾伟林
	 * @param roleName
	 * @return Role
	 */
	Role roleInfo(String roleCode);
	
	/**
	 * 根据管理员id查询管理员信息
	 * @author 曾伟林
	 * @param manId
	 * @return ManagerInfo
	 */
	ManagerInfo oneMan(String manId);
	
	String distributeChecker(String currentActivityId);
	
	/**
	 * 修改管理员角色
	 * @author 曾伟林
	 * @return
	 */
	Date updateRoleOfMan(String manId,String roleCode);

}
