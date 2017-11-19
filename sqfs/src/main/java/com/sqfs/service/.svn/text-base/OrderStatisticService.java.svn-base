package com.sqfs.service;

import java.util.List;

import com.sqfs.beans.OrderSearch;

/**
 * 订单统计
 * @author LSZ
 */
public interface OrderStatisticService {

	/**
	 * 统计查询某日的订单
	 * @param orderSearch 查询条件包含日期,订单类型,订单状态.如果是借贷订单还可以根据借贷类型查询统计
	 * @return 返回订单统计集合
	 */
	List<Object> getOrderStatisticInfo(OrderSearch orderSearche);
	
	/**
	 * 统计查询某日的订单 ---> 跳转到尾页,首页
	 * @param orderSearch 查询条件包含日期,订单类型,订单状态.如果是借贷订单还可以根据借贷类型查询统计
	 * @param orderSearch 执行上下翻页操作
	 * @return 返回订单统计集合
	 */
	List<Object> getOrderStatisticInfo4FirstAndLastPage(String type);
	
	
	/**
	 * 统计查询某日的订单 ---> 执行上下一页
	 * @param orderSearch 查询条件包含日期,订单类型,订单状态.如果是借贷订单还可以根据借贷类型查询统计
	 * @param orderSearch 执行上下翻页操作
	 * @return 返回订单统计集合
	 */
	List<Object> getOrderStatisticInfo4PreAndNextPage(String type);
	
}
