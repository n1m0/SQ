package com.sqfs.dto;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 
* @Description: TODO(个人资金) 
* @author 丁振兴
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class PersonalFund {
	private BigDecimal account_balance;//账户余额
	
	//投资总金额(已投资总金额)
	private BigDecimal totalPrincipal;
	//投资总利息(已完成订单)
	private BigDecimal totalAccrualt;
	//待收本金(未完成本金)
	private BigDecimal principalToBeCollected;
	//待收利息(未完成利息)
	private BigDecimal accrualtToBeCollected;
	//待收本息(未完成本金加利息)
	private BigDecimal principalAndAccrualt;
}













