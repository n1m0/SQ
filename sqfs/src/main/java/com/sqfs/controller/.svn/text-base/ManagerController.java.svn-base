package com.sqfs.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sqfs.beans.ManagerInfo;
import com.sqfs.beans.Role;
import com.sqfs.mapper.ManagerMapper;
import com.sqfs.service.ManagerService;

/**
 * 主页面管理员信息模块（角色管理、权限管理）CRUD
 * @author 曾伟林
 * @date 2017年11月10日下午12:08:40
 */
@Controller
@Scope("prototype")
@RequestMapping("/backStage/man")
@Slf4j
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private ManagerMapper managerMapper;
	
	/**
	 * 异步请求所有管理员信息
	 * @author 曾伟林
	 * @return blogin
	 */
	@RequestMapping("/showAll")
	public String showAll(Model model){	
		try {
			List<ManagerInfo> manList = managerService.allMan();
			model.addAttribute("manList",manList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bmanagerInfo";
	}
	
	/**
	 * 条件查询管理员信息
	 * @author 曾伟林
	 * @return bmanagerInfo
	 */
	@RequestMapping(value="/selectMans",method =RequestMethod.POST)
	public String selectMans(ManagerInfo man, Model model){	
		log.info(man.toString());
		try {
			List<ManagerInfo> manList = managerService.mansDynamic(man);
			model.addAttribute("manList",manList);
			log.info(manList.toString());
		} catch (Exception e) {
			log.info(e.toString());
		}
		return "bmanagerInfo";
	}
	
	/**
	 * 添加管理员
	 * @author 曾伟林
	 * @return bmanagerInfo
	 */
	@ResponseBody
	@RequestMapping(value="/addMan",produces="application/json; charset=UTF-8")
	public String addMan(ManagerInfo man){	
		log.info(man.toString());
		try {
			String result = managerService.addMan(man);
			return result;
		} catch (Exception e) {
			log.info(e.toString());
		}
		return null;
	}
	
	/**
	 * 修改密码
	 * @author 曾伟林
	 * @return bmanagerInfo
	 */
	@ResponseBody
	@RequestMapping(value="/updatePword",produces="application/json; charset=UTF-8")
	public String updatePword(@RequestParam String nPword,@RequestParam String manId,
			HttpSession session){	
		try {
			String result = managerService.updatePword(nPword,manId,session);
			return result;
		} catch (Exception e) {
			log.info(e.toString());
		}
		return null;
	}
	
	/**
	 * ajax角色信息反馈
	 * @author 曾伟林
	 * @return bmanagerInfo
	 */
	@ResponseBody
	@RequestMapping(value="/roleInfo",produces="application/json; charset=UTF-8",method=RequestMethod.POST)
	public Role roleInfo(@RequestParam String roleCode,Model model){	
		JSONObject result = new JSONObject();
		try {
			Role role = managerService.roleInfo(roleCode);			
			return role;
		} catch (Exception e) {
			log.info(e.toString());
		}
		return null;
	}
	
	/**
	 * 展示角色修改对话框
	 * @author 曾伟林
	 * @return bmodifyPword
	 */
	@RequestMapping("/bmodifyRole")
	public String pageChange(@RequestParam("manId")String manId,
			@RequestParam("roleCode")String roleCode,Model model,
			HttpSession session){
		try {
			Role roleInfo = managerService.roleInfo(roleCode);
			model.addAttribute("roleInfo", roleInfo);
			session.setAttribute("MANID_IN_SESSION", manId);
			session.setAttribute("ROLECODE_IN_SESSION", roleCode);
			return "bmodifyRole";
		} catch (Exception e) {
			log.info(e.toString());
		}
		return null;
	}
	
	/**
	 * ajax 管理员角色修改
	 * @author 曾伟林
	 * @return bmodifyPword
	 */
	@ResponseBody
	@RequestMapping(value="/updateRole",produces="application/json; charset=UTF-8")
	public String updateRole(@RequestParam("roleCode")String roleCode,Model model,
			HttpSession session){
		
		try {
			JSONObject result = new JSONObject();
			String manId = (String) session.getAttribute("MANID_IN_SESSION");
			log.debug("====111111=====" +manId);
			Date opeTime = managerService.updateRoleOfMan(manId, roleCode);
			SimpleDateFormat sqf = new SimpleDateFormat("yyyy-MM-dd");
			String strOpeTime = sqf.format(opeTime);
			if (opeTime != null){
				//session.removeAttribute("MANID_IN_SESSION");
			//	session.removeAttribute("ROLECODE_IN_SESSION");
				log.debug("====111111=====" +strOpeTime);
				result.put("strOpeTime", strOpeTime);
				return result.toString();
				//return message;
			}
		} catch (Exception e) {
			log.info(e.toString());
		}
		return null;
	}

}
