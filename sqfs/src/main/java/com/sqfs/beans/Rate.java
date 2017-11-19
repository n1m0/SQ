package com.sqfs.beans;

import java.io.Serializable;
import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


/**
 *	利率实体类
 * @author 秦英杰(on 上午10:42:22)
 * @see
 * @version
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Rate implements Serializable{
	private String	rate_id;//主键id
	private int hk_time;//还款期限
	private BigDecimal	rate_num_l;//借贷利率,是小数,注意在页面转成百分号的时候*100
	private BigDecimal	rate_num_i;//投资利率

}	
