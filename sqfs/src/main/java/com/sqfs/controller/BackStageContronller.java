package com.sqfs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sqfs.beans.ManagerInfo;
import com.sqfs.mapper.ManagerMapper;
import com.sqfs.service.CheckOrderService;
import com.sqfs.service.ManagerService;
import com.sqfs.service.OrderHandlerService;

import lombok.extern.slf4j.Slf4j;
/**
 * 后台页面跳转控制层
 * @author zwl
 * @date 2017年11月9日上午9:41:30
 */

@Controller
@Scope("prototype")
@RequestMapping("/backStage")
@Slf4j
public class BackStageContronller{
	
	@Autowired
	private ManagerService managerService;
	
	/*****************************************************************/
	@Autowired
	private ManagerMapper managerMapper;	
	@Autowired
	private  CheckOrderService checkOrderService;
	@Autowired
	private  OrderHandlerService orderHandlerService;
	
	@ResponseBody
	@RequestMapping("/test")
	public String test(String nPword,String manId){
	//	String manId = "SQ123";
	//	man.setManId("SQ123");
		log.debug("=================="+nPword+manId);
		System.out.println("测试");
		//String result = managerService.updatePword(nPword,manId);
		//log.debug("=================="+result);
		/*for(ManagerInfo man2: allMan){
			System.out.println(man2);
		}*/
		return "success";
	}
	/*****************************************************************/
	
	
	/**
	 * 后台退出登陆
	 * @author 曾伟林
	 * @return 
	 */
	@RequestMapping("/m/logout")
	public String logout(HttpSession session){	
		try {
			/** 注销当前会话 */
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/backStage";
	}
	/**
	 * ajax 异步登录跳转
	 * @author 曾伟林
	 * @return bmain
	 */
	@ResponseBody  // 异步请求的响应结果
	@RequestMapping(value="/blogin",produces="application/json; charset=UTF-8")
	public String login(@RequestParam("manId")String manId, 
			@RequestParam("passWord")String passWord 
			,@RequestParam("vcode")String vcode
			,@RequestParam("saveUserInfo") String saveUserInfo
			,HttpSession session,HttpServletResponse resp){
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("manId", manId);
			params.put("passWord", passWord);
			params.put("vcode", vcode);
			params.put("session", session);
			params.put("saveUserInfo", saveUserInfo);
			// 响应数据
			String result = managerService.login(params,resp);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
	/** ---------------------------静态页面跳转-------------------------------- */
	
	/**
	 * 后台展示登录页面
	 * @author 曾伟林
	 * @return blogin
	 */
	@RequestMapping("")
	public String login(){				
		return "blogin";
	}
	
	/**
	 * 进入主页面
	 * @author 曾伟林
	 * @return blogin
	 */
	@RequestMapping("/m/bmain")
	public String main(){				
		return "bmain";
	}
	
	/******************************************/
	/**
	 * 展示角色管理窗口
	 * @author 曾伟林
	 * @return bmanagerInfo
	 */
	@RequestMapping("/m/bmanagerInfo")
	public String managerInfo(){				
		return "bmanagerInfo";
	}
	/******************************************/
	
	/**
	 * 展示修改密码对话框
	 * @author 曾伟林
	 * @return bmodifyPword
	 */
	
	@RequestMapping("/m/bmodifyPword")
	public String pageChange(){				
		return "bmodifyPword";
	}
	/**
	 * 展示主页面背景图片
	 * @author 曾伟林
	 * @return bgground
	 */
	@RequestMapping("/m/bgground")
	public String bgground(){				
		return "bgground";
	}
	
	/**
	 * 展示订单统计窗口
	 * @author 曾伟林
	 * @return borderStatistics
	 */
	@RequestMapping("/m/borderStatistics")
	public String orderStatistics(){				
		return "borderStatistics";
	}
	
	/**
	 * 展示权限窗口
	 * @author 曾伟林
	 * @return bright
	 */
	@RequestMapping("/m/bright")
	public String right(){				
		return "bright";
	}
	
	
}
