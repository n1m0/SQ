package com.sqfs.beans;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;



/**
 *	借贷订单实体类
 * @author 秦英杰(on 上午10:42:22)
 * @see
 * @version
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Loan implements Serializable {
	
	private static final long serialVersionUID = 5593307073797240639L;
	private String	loan_dd_id;//主键id
	private String	user_id;//用户id
	private BigDecimal	loan_money;//借款金额
	private String	loan_name;//借款名称
	private Date	loan_date;//借款日期
	private String	loan_num;//借款编号
	private BigDecimal	daihuanbx;//待还本息
	private String loan_type;//还款类型
	private String	pro_id;//借款类型
	private String	rate_id;//还款期限
	private String	hk_type;//还款方式
	private String	loan_use;//借贷用途
	private String	sh_level;//审核级别
	private String	dd_state;//订单状态
	private String	cd_state;//客户订单状态
	private Date	sp_time1;//审批日期1
	private Date  sp_time2;//审批日期2
	private String	g_id;//审批人1id	
	private String	g_id2;//审批人2id
	private String	remark1;//备注1
	private String	remark2;//备注2
	private Date release_date;//发布日期
	private int commencement_date;//订单有筹款有效期
	private BigDecimal min_money;//起投金额	
	private String  tran_id;//还款表id
	private String zc_id;//借贷对应资产id
	private BigDecimal yitou;//已投金额
	private Rate rate;//利率对象
	private ProductType productType;//类型对象
	private SqUser sqUser;//用户对象
	private String taskid;//任务ID
	private Repayment repayment;//用户对象
	private String t_name;//用户真实姓名	
	private ZcInfo zcInfo;//资产对象
}
