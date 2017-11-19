package com.sqfs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sqfs.beans.OrderSearch;
import com.sqfs.service.OrderStatisticService;
import com.sqfs.utils.SqfsSessionContext;

/**
 * 订单统计
 * @author LSZ
 */
@Controller
@Scope("prototype")
@RequestMapping("/backStage")
public class OrderStatisticController {

	@Autowired
	OrderStatisticService orderStatisticService;
	
	/**
	 * 订单查询
	 * @param orderSearch 订单查询条件
	 * @return 返回订单集合
	 */
	@RequestMapping(value = "/m/backStage/m/os", method=RequestMethod.POST)
	@ResponseBody
	public List<Object> getOrderStatisticInfo(@RequestBody OrderSearch orderSearch) {
		//存储
		SqfsSessionContext.push("orderSearch", orderSearch);
		List<Object> list = orderStatisticService.getOrderStatisticInfo(orderSearch);
		if(list == null) {
			return null;
		}
		return list;
	} 
	
	//执行上下翻页操作
	@RequestMapping(value="/m/backStage/m/os/pn", method=RequestMethod.POST)
	public @ResponseBody List<Object> gotoPreAndNextPage(HttpServletRequest request) {
		String type = request.getParameter("type");
		List<Object> obj = orderStatisticService.getOrderStatisticInfo4PreAndNextPage(type);
		if(obj == null) return null;
		return obj;
	}

	//执行跳转到尾页
	@RequestMapping(value="/m/backStage/m/os/fl", method=RequestMethod.POST)
	public @ResponseBody List<Object> gotoFirstAndLastPage(HttpServletRequest request) {
		String type = request.getParameter("type");
		List<Object> obj = orderStatisticService.getOrderStatisticInfo4FirstAndLastPage(type);
		if(obj == null) return null;
		return obj;
	}
}
