package com.sqfs.beans;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import com.sqfs.dto.PersonalFund;

/**
 *	sq金服的用户类
 * @author 秦英杰(on 上午10:42:22)
 * @see
 * @version
 */
@Data  //注解在类上；提供类所有属性的 getting 和 setting 方法，此外还提供了equals、canEqual、hashCode、toString 方法 
@AllArgsConstructor//注解在类上；为类提供一个全参的构造方法 
@NoArgsConstructor //注解在类上；为类提供一个无参的构造方法 
@Builder
@ToString
public class SqUser implements Serializable {
	private String user_id;//用户主键id
	private String phone;//手机号码
	private String d_pwd;//登录密码
	private String user_name;//用户名
	private String bank_card;//银行卡号
	private BigDecimal account_balance = new BigDecimal(0.00);//账户余额
	private String user_pic;//用户头像
	private String t_name;//真实姓名
	private String id_card;//身份证号码     
	private String z_pwd;//用户支付密码
	private Date birthDate;//出生年月
	private String sex;//性别
	private String email;//邮箱
	private String education;//学历
	private String hy_status;//婚姻状况
	private String h_address;//户籍地址
	private String x_address;//居住地址
	private String w_position;//工作职位
	private BigDecimal m_income;//月收入
	private int w_year;//工作年限,按月
	private String jj_name;//紧急联系人
	private String jj_name_phone;//紧急联系人电话
	private String jj_name_rela;//和紧急联系人关系
	private String id_card_z;//身份证正面
	private String id_card_f;//身份证反面
	private String hukouben;//户口本
	private String jiehunzheng;//结婚证
	private String work_info;//工作证明
	private String liushuizhang;//工资流水账
	private String zhengxin;//征信报告
	private Date shang_time;//上次登陆时间
	private String third_party_payment;//第三方支付
	private String tombstone;//逻辑删除
	private int user_checked;//是否已经实名认证,0表示未认证1为已认证
	
	private List<Loan> loans;//借贷订单集合
	
	private List<Invest> invests; //投资订单集合
	
	private List<MoneyRecord> moneyRecords;//资金记录表
	
	private PersonalFund personalFund;//个人资金
	
	private ZcInfo zcInfo;//资产类
	
	private String trade_type;//资金记录类型
	private String trade_date;//资金记录时间
}
