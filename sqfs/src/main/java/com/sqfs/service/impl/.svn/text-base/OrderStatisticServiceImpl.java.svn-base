package com.sqfs.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqfs.beans.OrderSearch;
import com.sqfs.beans.OrderStatistics;
import com.sqfs.mapper.OrderStatisticMapper;
import com.sqfs.service.OrderStatisticService;
import com.sqfs.utils.PageUtil;
import com.sqfs.utils.SqfsSessionContext;

@Service
@Slf4j
public class OrderStatisticServiceImpl implements OrderStatisticService {

	@Autowired
	OrderStatisticMapper orderStatisticMapper;
	
	//获取订单统计信息
	public List<Object> getOrderStatisticInfo(OrderSearch orderSearch) {
		String orderType = orderSearch.getType();
		orderSearch.setCurrentPage(1);
		List<OrderStatistics> list = new ArrayList<OrderStatistics>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		int totleCount = 0;
		if("借贷".equals(orderType)) {
			list = getLoanOrderStatisticInfo(orderSearch);
			totleCount = getLoanOrderCount(orderSearch);
		} else {
			list = getInvestOrderStatisticInfo(orderSearch);
			totleCount = getInvestOrderCount(orderSearch);
		}
		//计算分页信息
		map = PageUtil.pagination(totleCount);
		List<Object> obj = new ArrayList<Object>();
		obj.add(list);
		obj.add(map);
		return obj;
	}

	//跳转到首尾页
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getOrderStatisticInfo4FirstAndLastPage(String type) {
		OrderSearch orderSearch = (OrderSearch)SqfsSessionContext.pop("orderSearch");
		//信息查找与更新
		Map<String, Integer> map = (Map<String, Integer>)SqfsSessionContext.pop("orderStatisticPageInfo");
		if(type.equals("尾页")) {
			int totlepage = map.get("totlepage");
			map.put("currentPage", totlepage);
			log.debug("----------------------->>>>> 尾页, {}", totlepage);
			orderSearch.setCurrentPage(totlepage);
		} else {
			map.put("currentPage", 1);
			orderSearch.setCurrentPage(1);
		}
		SqfsSessionContext.push("orderStatisticPageInfo", map);
		//
		List<OrderStatistics> osList = getOrderInfo(orderSearch);
		List<Object> obj = new ArrayList<Object>();
		obj.add(osList);
		obj.add(map);
		return obj;
	}
	
	//执行上一页操作
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getOrderStatisticInfo4PreAndNextPage(String type) {
		OrderSearch orderSearch = (OrderSearch)SqfsSessionContext.pop("orderSearch");
		Map<String, Integer> map = (Map<String, Integer>)SqfsSessionContext.pop("orderStatisticPageInfo");
		int currentPage = map.get("currentPage");
		currentPage = PageUtil.pagination(type, currentPage);
		map.put("currentPage", currentPage);
		SqfsSessionContext.push("orderStatisticPageInfo", map);
		orderSearch.setCurrentPage(currentPage);
		
		List<OrderStatistics> osList = getOrderInfo(orderSearch);
		List<Object> obj = new ArrayList<Object>();
		obj.add(osList);
		obj.add(map);
		return obj;
	}
		
	/**
	 * 获取订单统计类型
	 * @param orderSearch 根据订单类型获取订单统计信息
	 * @return
	 */
	private List<OrderStatistics> getOrderInfo(OrderSearch orderSearch) {
		List<OrderStatistics> osList = new ArrayList<OrderStatistics>();
		if("借贷".equals(orderSearch.getType())) {
			osList = getLoanOrderStatisticInfo(orderSearch);
		} else {
			osList = getInvestOrderStatisticInfo(orderSearch);
		}
		return osList;
	}
	
	//借贷订单
	protected List<OrderStatistics> getLoanOrderStatisticInfo(OrderSearch orderSearch) {
		return orderStatisticMapper.getLoanOrderStatisticInfo(orderSearch);
	}

	//投资订单
	protected List<OrderStatistics> getInvestOrderStatisticInfo(
			OrderSearch orderSearch) {
		return orderStatisticMapper.getInvestOrderStatisticInfo(orderSearch);
	}

	//分页处理
	protected int getLoanOrderCount(OrderSearch orderSearch) {
		return orderStatisticMapper.getLoanOrderCount(orderSearch);
	}

	//分页处理
	protected int getInvestOrderCount(OrderSearch orderSearch) {
		return orderStatisticMapper.getInvestOrderCount(orderSearch);
	}

}
