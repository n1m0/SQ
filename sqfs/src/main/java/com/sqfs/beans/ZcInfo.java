package com.sqfs.beans;

import java.math.BigDecimal;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 *	用户资产信息类
 * @author 秦英杰(on 上午10:42:22)
 * @see
 * @version
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class ZcInfo {
	private String	zc_id;//主键id
	private String  user_id;//用户id
	private String	zc_name;//资产名
	private String	zc_code;//资产牌号
	private Date	zc_date;//资产购买日期
	private BigDecimal	zc_luojia;//资产裸价
	private BigDecimal	zc_pinggujia;//评估价
	private String	zc_djzheng;//资产登记证证
	private String	zc_xianzheng;//资产险证
	private String	zc_pingguzheng;//资产评估证

}
