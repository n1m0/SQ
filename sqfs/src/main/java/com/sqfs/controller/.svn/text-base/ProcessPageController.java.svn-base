package com.sqfs.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sqfs.beans.ProcessDefinitionDto;
import com.sqfs.service.CheckOrderService;

/**
 * 流程管理分页
 * @author lsz
 */
@Controller
@Scope("prototype")
@RequestMapping("/backStage")
public class ProcessPageController {

	@Autowired
	CheckOrderService checkOrderService;
	
	/**
	 * 首页跳转
	 */
	@RequestMapping(value = "/m/first-page", method=RequestMethod.POST)
	@ResponseBody
	public List<Object> firstPage() {
		//获取首页流程定义信息
		List<ProcessDefinitionDto> list = checkOrderService.getAllProcessDefinitionInfo(1);
		//重新设置分页
		Map<String, Long> map = checkOrderService.countProcessDefinition("默认");	
		List<Object> o = new ArrayList<>();
		o.add(list);
		o.add(map);
		return o;
	}
	
	/**
	 * 尾页跳转
	 */
	@RequestMapping(value = "/m/last-page", method=RequestMethod.POST)
	@ResponseBody
	public List<Object> lastPage() {
		Map<String, Long> map = checkOrderService.countProcessDefinition("默认");
		long page = map.get("pages");
		//重新设置分页
		map.put("pages", page);	
		map.put("currentPage", page);
		//获取首页流程定义信息
		List<ProcessDefinitionDto> list = checkOrderService.getAllProcessDefinitionInfo((int) page);
		List<Object> o = new ArrayList<>();
		o.add(list);
		o.add(map);
		return o; 
	}
	
	/**
	 * 执行上一页操作
	 * @param type 
	 * @return
	 */
	@RequestMapping(value = "/m/pre-page", method=RequestMethod.POST)
	@ResponseBody
	public List<Object> prePage(HttpServletRequest request) {
		String type = request.getParameter("type");
		List<Object> o = pagination(type);
		return o; 
	}
	
	/**
	 * 执行下一页操作
	 * @param type 
	 * @return
	 */
	@RequestMapping(value = "/m/next-page", method=RequestMethod.POST)
	@ResponseBody
	public List<Object> nextPage(HttpServletRequest request) {
		String type = request.getParameter("type");
		List<Object> o = pagination(type);
		return o; 
	}
	
	/**
	 * 获取上下分页的数据
	 * @param type 执行上一页或者下一页
	 */
	protected List<Object> pagination(String type) {
		//获取页数
		Map<String, Long> map = checkOrderService.countProcessDefinition(type);
		long page = map.get("currentPage");		
		//获取首页流程定义信息
		List<ProcessDefinitionDto> list = checkOrderService.getAllProcessDefinitionInfo((int) page);
		
		List<Object> o = new ArrayList<>();
		o.add(list);
		o.add(map);
		return o;
	}
	
	/**
	 * 指定跳转到某一页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/m/go", method=RequestMethod.POST)
	@ResponseBody
	public List<Object> toPage(HttpServletRequest request) {
		String page = request.getParameter("type");
		Map<String, Long> map = checkOrderService.countProcessDefinition("默认");
		//设置当前页
		map.put("currentPage", Long.parseLong(page));
		List<ProcessDefinitionDto> list = checkOrderService.getAllProcessDefinitionInfo(Integer.parseInt(page));
		List<Object> o = new ArrayList<>();
		o.add(list);
		o.add(map);
		return o;
	}
	
	/**
	 * 删除流程部署
	 * @return
	 */
	@RequestMapping(value = "m/del", method=RequestMethod.POST)
	@ResponseBody
	public List<Object> deleteDeployment(HttpServletRequest request) {
		//删除部署
		String deploymentId = request.getParameter("type");
		checkOrderService.deleteProcessDefinition(deploymentId);
		//获取部署信息
		//获取首页流程定义信息
		List<ProcessDefinitionDto> list = checkOrderService.getAllProcessDefinitionInfo(1);
		//重新设置分页
		Map<String, Long> map = checkOrderService.countProcessDefinition("默认");
		List<Object> o = new ArrayList<>();
		o.add(list);
		o.add(map);
		return o;
	}
}
