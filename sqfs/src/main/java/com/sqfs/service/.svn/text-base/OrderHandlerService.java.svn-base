package com.sqfs.service;





/**
 * 订单维护
 * @author LSZ
 */

public interface OrderHandlerService {
	
	/**
	 * 更新订单状态
	 * @param loanOrderId 订单号
	 * @param status 订单状态
	 */
	void updateOrderStatusById(String loanOrderId, String status);
	
	
	/**
	 * 一审之后更新订单状态
	 * @param loanOrderId 订单号
	 * @param remark 审核批注
	 * @param status 订单状态
	 * @param checker 审核人
	 */
	void update1OrderStatusById(String loanOrderId, String status,String remark,String checker);
	
	/**
	 * 二审之后更新订单状态
	 * 
	 * */
	
	void update2OrderStatusById(String loanOrderId, String status,String remark,String checker);

}
