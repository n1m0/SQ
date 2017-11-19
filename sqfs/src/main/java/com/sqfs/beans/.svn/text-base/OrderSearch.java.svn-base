package com.sqfs.beans;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.ToString;

/**
 * 订单查询条件
 * @author LSZ
 */
@Data
@ToString
public class OrderSearch {

	@DateTimeFormat(pattern="yyyy-MM-dd")
	//日期
	private String date;
	
	//订单类型,投资或者借贷
	private String type;
	
	//订单状态
	private String status;
	
	//借贷类型,车易贷或者房易贷
	private String ltype;
	
	private int currentPage;
}
