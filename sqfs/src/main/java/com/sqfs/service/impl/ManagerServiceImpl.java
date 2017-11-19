package com.sqfs.service.impl;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import lombok.extern.slf4j.Slf4j;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.sqfs.beans.ManagerInfo;
import com.sqfs.beans.Role;
import com.sqfs.mapper.ManagerMapper;
import com.sqfs.service.ManagerService;

/**
 * 后台管理员信息业务处理实现
 * @author zwl
 * @date 2017年11月9日下午5:09:24
 */
@Slf4j
@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerMapper managerMapper;
	

	/**
	 * 后台管理员登录业务处理
	 * @author zwl
	 * @date 2017年11月9日下午5:09:24
	 */
	public String login(Map<String, Object> params,HttpServletResponse resp) {

		JSONObject result = new JSONObject();
		try {
			/** 处理登录的业务逻辑 */
			/** 1.参数非空校验 */
			String manId = (String) params.get("manId");
			String passWord = (String) params.get("passWord");
			String vcode = (String) params.get("vcode");
			String saveUserInfo=(String)params.get("saveUserInfo");
			HttpSession session = (HttpSession) params.get("session");
			// userId!=null&&!userId.equals("")
			if(StringUtils.isEmpty(manId) || StringUtils.isEmpty(passWord) || StringUtils.isEmpty(vcode)) {
				/** 参数有为空的 */
				result.put("status", 0);
				result.put("tip", "参数有为空的");
			} else {
				/** 参数不为空 */
				/**
				 * 校验验证码是否正确 获取session中当前用户对应的验证码
				 */
				String sysCode = (String) session.getAttribute("BSVCODE_IN_SESSION");
				if (vcode.equalsIgnoreCase(sysCode)) {
					/** 验证码正确了 */
					/** 根据登录的用户名去查询用户: 判断登录名是否存在 */
					ManagerInfo manager = managerMapper.findManbyId(manId);
					if (manager != null) {
						/** 登录名存在 */
						/** 判断密码 */
						if("N".equals(manager.getRole().getRoleCode())){
							/** 管理员角色已移除，不能登录 */
							result.put("status", 5);
							result.put("tip", "权限已失效，无法登录！");
						}else{
							if (manager.getPassWord().equals(passWord)) {
								/** 登录成功 */
								/** 把登录成功的用户放入当前用户的session会话中 */
								session.setAttribute("MANAGER_IN_SESSION", manager);
									if(saveUserInfo!=null&&!"".equals(saveUserInfo)){
										Cookie nameCookie = new Cookie("manId", URLEncoder.encode(manager.getManId(), "utf-8"));
										Cookie padCookie = new Cookie("passWord", manager.getPassWord());
										nameCookie.setMaxAge(24*60*60);
										padCookie.setMaxAge(24*60*60);
										nameCookie.setPath("/");
										padCookie.setPath("/");
										resp.addCookie(nameCookie); 
										resp.addCookie(padCookie);
									}
								result.put("status", 1);
								result.put("tip", "登录成功");
							} else {
								/** 密码错误 */
								result.put("status", 2);
								result.put("tip", "密码错误了");
							}
						}
					} else {
						/** 登录名不存在 */
						result.put("status", 3);
						result.put("tip", "没有该账户");
					}
				} else {
					/** 验证码不正确 */
					result.put("status", 4);
					result.put("tip", "验证码不正确");
				}
			}
			return result.toString();
		} catch (Exception e) {
			//throw new BackStageException("异步登录业务层抛出异常了", e);
			log.info(e.toString());
			return null;
		}
	}


	/**
	 * 角色管理显示查询所有管理员
	 * @author zwl
	 * @date 2017年11月9日下午5:09:24
	 */
	public List<ManagerInfo> allMan() {
		List<ManagerInfo> manInfoList = managerMapper.findAllMan();
		return manInfoList;
	}

	//动态分配审核人
	public String  distributeChecker(String currentActivityId) {
		log.info("================"+currentActivityId);
		String name=managerMapper.distributeChecker(currentActivityId);	
		log.info("==================name"+name);
		return name;
	}


	/**
	 * 动态查询管理员信息业务处理
	 * @author zwl
	 * @date 2017年11月9日下午5:09:24
	 */
	public List<ManagerInfo> mansDynamic (ManagerInfo man) {
		Role manRole = man.getRole();
		if (manRole != null){
			String roleName = manRole.getRoleName();
			if (!StringUtils.isEmpty(roleName)){
				Role role = managerMapper.findRolebyName(roleName);
				man.setRoleId(role.getRoleId());
				//log.info(man.toString());
			}
		}
		List<ManagerInfo> manList = managerMapper.findManDynamic(man);
		return manList;
	}


	/**
	 * 新增管理员
	 * @author zwl
	 * @param man
	 * @date 2017年11月13日下午5:09:24
	 */
	public String addMan(ManagerInfo man) {
		JSONObject reuslt = new JSONObject();
		try {
			/**生成操作时间*/
			Date poeTime = new Date();
			man.setOperateTime(poeTime);
			
			/**设置初始密码*/
			man.setPassWord("123456");
			
			/**根据角色名查询角色id，设置到man中*/
			Role role = managerMapper.findRolebyName(man.getRole().getRoleName());
			man.setRoleId(role.getRoleId());
			
			/**插入man到数据库中*/
			Integer addNum = managerMapper.addMan(man);
			log.info(addNum.toString());
			
			/**判断插入是否成功，返回提示信息*/
			if (addNum != 0){
				reuslt.put("tip", "添加管理员成功！");
			} else {
				reuslt.put("tip", "添加管理员异常！");
			}
			return reuslt.toString();
		} catch (Exception e) {
			log.info(e.toString());
		}
		return null;
	}

	/**
	 * 修改当前用户密码
	 * @author 曾伟林
	 * @return
	 * @throws
	 */
	public String updatePword(String nPword,String manId,HttpSession session) {
		JSONObject result = new JSONObject();
		try {
			/** 判断是重置密码还是用户修改个人密码*/
			ManagerInfo manInfo = (ManagerInfo) session.getAttribute("MANAGER_IN_SESSION");
			/**重置密码，否则为个人修改密码*/
			if (!manId.equals(manInfo.getManId())){
				nPword = "888888";
			}
			Integer back = managerMapper.updatePword(nPword,manId);
			/**判断修改是否成功，返回提示信息*/
			if (back != 0){
				result.put("status", 0);
				//result.put("tip", "修改密码成功，请重新登录！");
			} else {
				result.put("status", 1);
				//result.put("tip", "修改密码失败！");
			}
			return result.toString();
		} catch (JSONException e) {
			log.info(e.toString());
		}
		return null;
	}

	/**
	 * 重置密码
	 * @author 曾伟林
	 * @return
	 * @throws
	 */
	public String resetPword(String nPword,String manId) {
		JSONObject result = new JSONObject();
		try {
			Integer back = managerMapper.updatePword(nPword,manId);
			/**判断插入是否成功，返回提示信息*/
			if (back != 0){
				result.put("status", 0);
				result.put("tip", "修改密码成功，请重新登录！");
			} else {
				result.put("status", 1);
				result.put("tip", "修改密码失败！");
			}
			return result.toString();
		} catch (JSONException e) {
			log.info(e.toString());
		}
		return null;
	}

	/**
	 * 根据角色标识查询角色信息
	 * @author 曾伟林
	 * @return Role
	 * @throws
	 */
	public Role roleInfo(String roleCode) {
		try {
			Role role = managerMapper.findRolebyCode(roleCode);
			return role;
		} catch (Exception e) {
			log.info(e.toString());
		}
		return null;
	}
	
	/**
	 * 根据id查询管理员信息
	 * @author 曾伟林
	 * @return Role
	 * @throws
	 */
	public ManagerInfo oneMan(String manId) {
		try {
			ManagerInfo man = managerMapper.findManbyId(manId);
			return man;
		} catch (Exception e) {
			log.info(e.toString());
		}
		return null;
	}

	/**
	 * 根据角色标识修改管理员角色id
	 * @author 曾伟林
	 * @return String
	 * @throws
	 */
	public Date updateRoleOfMan(String manId, String roleCode) {
		try {
			String roleId = managerMapper.findRoleIdbyRoleCode(roleCode);
			// sqf = new SimpleDateFormat("yyyy-MM-dd");
			Date opeTime = new Date();
			//String strTime = sqf.format(opeTime);
			//opeTime = sqf.parse(strTime);
			//log.info(opeTime.toString());
			Integer updateNum = managerMapper.updateRoleIdOfMan(roleId,opeTime,manId);
			if (updateNum != 0){
				return opeTime;
			}
		} catch (Exception e) {
			log.info(e.toString());
		}
		return null;
	}
}
