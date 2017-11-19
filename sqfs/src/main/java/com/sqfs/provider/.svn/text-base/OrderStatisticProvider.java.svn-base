package com.sqfs.provider;

import org.apache.ibatis.jdbc.SQL;

import com.sqfs.beans.OrderSearch;

/**
 * 批量统计查询某日的订单信息
 * @author ASUS
 */
public class OrderStatisticProvider {

	//统计查询借贷订单
	public String getLoanOrderStatisticInfo(final OrderSearch orderSearch) {
		int maxResult = 5;
		int startPos = (orderSearch.getCurrentPage() - 1) * maxResult;
		return new SQL(){
			{
				SELECT("DATE_FORMAT(loan_date, '%Y-%m-%d') date, cd_state status, SUM(loan_money) money, "
						+ "COUNT(*) count, loan_type ltype");
				FROM(" loan_dd ");
				//日期
				if(orderSearch.getDate()!=null) {
					WHERE("DATE_FORMAT(loan_date, '%Y-%m-%d') = #{date} ");
				}
				//状态
				if(!orderSearch.getStatus().equals("默认")) {
					WHERE("cd_state = #{status} ");
				}
				//借贷类型
				if(!orderSearch.getLtype().equals("默认")) {
					WHERE("loan_type = #{ltype} ");
				}
				GROUP_BY("DATE_FORMAT(loan_date, '%Y-%m-%d') ,cd_state, loan_type ");
				ORDER_BY("DATE_FORMAT(loan_date, '%Y-%m-%d') ");
			}
		}.toString() + "DESC limit " + startPos + "," + maxResult;
	}
	
	//统计查询投资订单
	public String getInvestOrderStatisticInfo(final OrderSearch orderSearch) {
		int maxResult = 5;
		int startPos = (orderSearch.getCurrentPage() - 1) * maxResult;
		return new SQL(){
			{
				SELECT("DATE_FORMAT(tz_time, '%Y-%m-%d') date, tz_state status, SUM(tz_money) money, "
						+ "COUNT(*) count ");
				FROM(" tz_dd ");
				//日期
				if(orderSearch.getDate()!=null) {
					WHERE("DATE_FORMAT(tz_time, '%Y-%m-%d') = #{date} ");
				}
				//状态
				if(!orderSearch.getStatus().equals("默认")) {
					WHERE("tz_state = #{status} ");
				}
				GROUP_BY("DATE_FORMAT(tz_time, '%Y-%m-%d') ,tz_state ");
				ORDER_BY("DATE_FORMAT(tz_time, '%Y-%m-%d') ");
			}
		}.toString() + "DESC limit " + startPos + "," + maxResult;
	}
	
	//获取每日借贷订单的总数
	public String getLoanOrderStatisticCount(final OrderSearch orderSearch) {
		//
		final String sql = new SQL(){{
			SELECT(" COUNT(*) count ");
			FROM(" loan_dd ");
			//日期
			if(orderSearch.getDate()!=null) {
				WHERE("DATE_FORMAT(loan_date, '%Y-%m-%d') = #{date} ");
			}
			//状态
			if(!orderSearch.getStatus().equals("默认")) {
				WHERE("cd_state = #{status} ");
			}
			//借贷类型
			if(!orderSearch.getLtype().equals("默认")) {
				WHERE("loan_type = #{ltype} ");
			}
			GROUP_BY("DATE_FORMAT(loan_date, '%Y-%m-%d') ,cd_state, loan_type ");
			ORDER_BY("DATE_FORMAT(loan_date, '%Y-%m-%d') ");
		}}.toString() + "DESC";
		
		return new SQL(){
			{
				SELECT(" COUNT(*) ");
				FROM("(" + sql +" ) As t");
			}
		}.toString();
	}
	
	//统计每日投资订单总数
	public String getInvestOrderStatisticCount(final OrderSearch orderSearch) {
		final String sql = new SQL(){{
			SELECT(" COUNT(*) count ");
			FROM(" tz_dd ");
			//日期
			if(orderSearch.getDate()!=null) {
				WHERE("DATE_FORMAT(tz_time, '%Y-%m-%d') = #{date} ");
			}
			//状态
			if(!orderSearch.getStatus().equals("默认")) {
				WHERE("tz_state = #{status} ");
			}
			GROUP_BY("DATE_FORMAT(tz_time, '%Y-%m-%d') ,tz_state ");
			ORDER_BY("DATE_FORMAT(tz_time, '%Y-%m-%d') ");
		}}.toString() + "DESC";
		
		return new SQL(){
			{
				SELECT(" COUNT(*) ");
				FROM("(" + sql +" ) As t");
			}
		}.toString();
	}
}
