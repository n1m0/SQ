package com.sqfs.beans;

import java.math.BigDecimal;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


/**
 * 
* @Description: TODO(资金记录表) 
* @author 丁振兴
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class MoneyRecord {
	
	private String money_record_id;//资金记录主键id
	private String user_id;//用户id
	private String trade_type;//交易类型
	private BigDecimal trade_money;//交易金额
	private BigDecimal balance;//交易余额
	private Date trade_date;//交易日期
	private String remark;//备注
	
	
	private int startNum;//开始行
	private int showRows;//结束行
}
