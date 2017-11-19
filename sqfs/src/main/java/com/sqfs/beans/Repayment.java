package com.sqfs.beans;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


/**
 *	还款实体类
 * @author 秦英杰(on 上午10:42:22)
 * @see
 * @version
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Repayment {
	private String	tran_id;//主键id
	private int	qishu;//期数
	private BigDecimal	yh_benjin;//应还本金
	private BigDecimal	yh_lixi;//应还利息
	private String	hk_state;//还款状态
	private BigDecimal	yh_bx;//已还本息
	private BigDecimal	dh_bx;//待还本息
	
	

}
