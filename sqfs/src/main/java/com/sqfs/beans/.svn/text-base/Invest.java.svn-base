package com.sqfs.beans;

import java.math.BigDecimal;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import com.sqfs.dto.PersonalFund;
/**
 *	针对单个产品投标情况实体类
 * @author 秦英杰(on 上午10:42:22)
 * @see
 * @version
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Invest {
	private String	tz_dd_id;//主键id
	private String	user_id;//投标人id
	private BigDecimal	tz_money;//投资金额
	private Date	tz_time;//投资时间
	private BigDecimal accrualt;//利息,我的收益
	private String	loan_dd_id;//借贷订单id
	private BigDecimal	dqye;//当前账户余额
	private String tz_state;//投资状态
	private String remark;//备注
	private String tombstone;//逻辑删除
	
	private Date leadTime;//回款时间
	private BigDecimal principalAndAccrualt;//回款金额,本金加利息
	private Loan loan;//借贷订单

	private PersonalFund personalFund;//个人资金

	private SqUser sqUser;//用户对象
	


}






