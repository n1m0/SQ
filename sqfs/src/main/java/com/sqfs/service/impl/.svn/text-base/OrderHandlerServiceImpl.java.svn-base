package com.sqfs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqfs.mapper.ManagerMapper;
import com.sqfs.service.OrderHandlerService;


/**
 * 订单维护
 * @author LSZ
 */
@Service
public class OrderHandlerServiceImpl implements OrderHandlerService {
	
	@Autowired
	private ManagerMapper managerMapper;
	
	//客户提交订单,更新订单状态
	public void updateOrderStatusById(String loan_dd_id, String status) {
		managerMapper.updateUncheckOrderStatusById(loan_dd_id, status);
	}

	@Override//一审之后订单更新
	public void update1OrderStatusById(String loan_dd_id, String comment,
			 String checker, String remark) {
		managerMapper.update1OrderStatusById(loan_dd_id, comment, remark, checker);		
	}

	@Override//二审之后订单更新
	public void update2OrderStatusById(String loan_dd_id, String comment,
			 String checker, String remark) {		
		managerMapper.update2OrderStatusById(loan_dd_id, comment, checker, remark);
	}
	
}
