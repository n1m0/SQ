package com.sqfs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.SelectProvider;

import com.sqfs.beans.OrderSearch;
import com.sqfs.beans.OrderStatistics;
import com.sqfs.provider.OrderStatisticProvider;

@Mapper
public interface OrderStatisticMapper {

	/**
	 * 统计查询某日的借贷订单
	 * @param orderSearch 查询条件包含日期,订单类型,订单状态.如果是借贷订单还可以根据借贷类型查询统计
	 * @return 返回借贷订单统计集合
	 */
	@SelectProvider(type=OrderStatisticProvider.class, method="getLoanOrderStatisticInfo")
	List<OrderStatistics> getLoanOrderStatisticInfo(OrderSearch orderSearch);
	
	/**
	 * 统计查询某日的投资订单
	 * @param orderSearch 查询条件包含日期,订单类型,订单状态
	 * @return 返回投资订单统计集合
	 */
	@SelectProvider(type=OrderStatisticProvider.class, method="getInvestOrderStatisticInfo")
	List<OrderStatistics> getInvestOrderStatisticInfo(OrderSearch orderSearch);
	
	/**
	 * 分页统计每日各个订单的总数
	 * @param orderSearch 查询条件包含日期,订单类型,订单状态.如果是借贷订单还可以根据借贷类型查询统计
	 * @return 返回总数用于分页处理
	 */
	@SelectProvider(type=OrderStatisticProvider.class, method="getLoanOrderStatisticCount")
	int getLoanOrderCount(OrderSearch orderSearch);
	
	/**
	 * 分页统计每日各个订单的总数
	 * @param orderSearch 查询条件包含日期,订单类型,订单状态
	 * @return 返回总数用于分页处理
	 */
	@SelectProvider(type=OrderStatisticProvider.class, method="getInvestOrderStatisticCount")
	int getInvestOrderCount(OrderSearch orderSearch);
}
