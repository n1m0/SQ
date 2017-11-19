package com.sqfs.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import com.sqfs.beans.Invest;
import com.sqfs.beans.Loan;
import com.sqfs.beans.SqUser;
import com.sqfs.provider.ProductProvider;
/**
 *	投资mapper层
 * @author 秦英杰(on 上午10:42:22)
 * @see
 * @version
 */
@Mapper
public interface ProductMapper {
	

	/**
	 *	按条件查询全部的借贷订单
	 * @param
	 * @return
	 * @exception
	 */
	@SelectProvider(type = ProductProvider.class, method = "totleQuery")
	int queryTotleList(Loan loan);
	
	
	
	/**
	 *	带条件分页查询借贷list
	 * @param
	 * @return
	 * @exception
	 */
	@SelectProvider(type = ProductProvider.class, method = "proListQuery")
	List<Loan> queryProList(Loan loan);
	
	
	/**
	 *	用于首页展示,不分页,不筛选
	 * @param
	 * @return
	 * @exception
	 */
	@Select("select l.loan_dd_id ,l.user_id ,l.loan_money ,l.loan_name ,l.loan_date ,l.loan_num ,"
			+ "l.daihuanbx ,l.loan_type,l.rate_id ,l.hk_type ,l.loan_use ,l.dd_state,l.cd_state,l.release_date,"
			+ "l.commencement_date,l.min_money,r.rate_id 'rate.rate_id',r.hk_time 'rate.hk_time',"
			+ "r.rate_num_l 'rate.rate_num_l',r.rate_num_i 'rate.rate_num_i',"
			+ "p.pro_id 'productType.pro_id',p.product_type 'productType.product_type'"
			+ " from loan_dd l, loan_tz_pro p,rate r  where p.product_type=l.loan_type "
			+ "and l.rate_id=r.rate_id and l.cd_state in ('筹款中','还款中','已结束')")
	List<Loan> getProList();
	
	/**
	 *	根据产品的id得到当前产品的投资金额的list(为了求已投金额)
	 * @param
	 * @return
	 * @exception
	 */
	@Select("select t.tz_money from  tz_dd t where t.loan_dd_id=#{loan_dd_id}")
	List<Invest> getYiTou(String loan_dd_id);
	
	
	/**
	 *	通过借贷订单id得到借贷订单详情
	 * @param
	 * @return
	 * @exception
	 */
	@Select("select l.loan_dd_id,l.user_id,l.loan_money,"
			+ "l.loan_name,l.loan_date,l.loan_num,"
			+ "l.daihuanbx,l.loan_type,l.rate_id,"
			+ "l.hk_type,l.loan_use,l.sh_level,"
			+ "l.dd_state,l.cd_state,l.sp_time1,l.sp_time2,"
			+ "l.g_id,l.g_id2,l.remark1,"
			+ "l.remark2,l.release_date,l.commencement_date,l.min_money,l.tran_id,l.taskid,l.zc_id,"
			+ "r.rate_id 'rate.rate_id',"
			+ "r.hk_time 'rate.hk_time',"
			+ "r.rate_num_l 'rate.rate_num_l',"
			+ "r.rate_num_i 'rate.rate_num_i',"
			+ "u.user_id 'sqUser.user_id',u.phone 'sqUser.phone',u.d_pwd 'sqUser.d_pwd',"
			+ "u.user_name 'sqUser.user_name',u.bank_card 'sqUser.bank_card',"
			+ "u.account_balance 'sqUser.account_balance',"
			+ "u.user_pic 'sqUser.user_pic',u.t_name 'sqUser.t_name',u.id_card 'sqUser.id_card',"
			+ "u.z_pwd 'sqUser.z_pwd',u.birthDate 'sqUser.birthDate',"
			+ "u.sex 'sqUser.sex',u.email 'sqUser.email',u.education 'sqUser.education',"
			+ "u.hy_status 'sqUser.hy_status',u.h_address 'sqUser.h_address',"
			+ "u.x_address 'sqUser.x_address',"
			+ "u.w_position 'sqUser.w_position',u.m_income 'sqUser.m_income',"
			+ "u.w_year 'sqUser.w_year',"
			+ "u.jj_name 'sqUser.jj_name',u.jj_name_phone 'sqUser.jj_name_phone',"
			+ "u.jj_name_rela 'sqUser.jj_name_rela',u.id_card_z 'sqUser.id_card_z',"
			+ "u.id_card_f 'sqUser.id_card_f',u.hukouben 'sqUser.hukouben',"
			+ "u.jiehunzheng 'sqUser.jiehunzheng',u.work_info 'sqUser.work_info',"
			+ "u.liushuizhang 'sqUser.liushuizhang',u.zhengxin 'sqUser.zhengxin',"
			+ "u.shang_time 'sqUser.shang_time',"
			+ "z.zc_id 'zcInfo.zc_id',"
			+ "z.zc_name 'zcInfo.zc_name', z.zc_code 'zcInfo.zc_code',z.zc_date 'zcInfo.zc_date',"
			+ "z.zc_luojia 'zcInfo.zc_luojia',z.zc_pinggujia 'zcInfo.zc_pinggujia',"
			+ "z.zc_djzheng 'zcInfo.zc_djzheng',z.zc_xianzheng 'zcInfo.zc_xianzheng',"
			+ "z.zc_pingguzheng 'zcInfo.zc_pingguzheng',"
			+ "p.pro_id 'productType.pro_id',p.product_type 'productType.product_type',"
			+ "h.tran_id 'repayment.tran_id',"
			+ "h.qishu 'repayment.qishu',"
			+ "h.yh_benjin 'repayment.yh_benjin',h.yh_lixi 'repayment.yh_lixi',"
			+ "h.hk_state 'repayment.hk_state',h.yh_bx 'repayment.yh_bx',"
			+ "h.dh_bx 'repayment.dh_bx'  "
			+ "from loan_dd l,rate r,sq_user u,loan_tz_pro p,zc_info z,hk_table h "
			+ "where l.tran_id=h.tran_id and u.user_id=l.user_id and l.rate_id=r.rate_id and "
			+ "p.product_type=l.loan_type and z.zc_id=l.zc_id "
			+ "and l.loan_dd_id=#{loan_dd_id}")
	Loan getLoansByLoanId(@Param("loan_dd_id")String loan_dd_id);
	
	
	
	
	
	/**
	 *	查询单个借贷产品所有投资人次
	 * @param
	 * @return
	 * @exception
	 */
	@Select("select count(1) from  tz_dd t where t.loan_dd_id=#{loan_dd_id}")
	int getTotleInvestNum(String loan_dd_id);
	
	
	
	/**
	 *	通过借贷订单id得到投资人的list
	 * @param
	 * @return
	 * @exception
	 */
	@SelectProvider(type = ProductProvider.class, method = "investList")
	List<Invest> getInvestsListByLoanId(String loan_dd_id);	
	
	/**
	 *	添加新的投资
	 * @param
	 * @return
	 * @exception
	 */
	@Insert("insert into tz_dd (tz_dd_id,user_id,tz_money,tz_time,accrualt,loan_dd_id,dqye,tz_state,remark) "
			+ "values(UUID(),#{user_id},#{tz_money},sysdate(),#{accrualt},#{loan_dd_id},#{dqye},#{tz_state},#{remark})")
	int add(Invest invest);
	
	
	/**
	 *	修改当前账户余额
	 * @param
	 * @return
	 * @exception
	 */
	@Update("update sq_user set account_balance=#{account_balance} where user_id=#{user_id}")
	int updateDqye(SqUser sqUser);
	
	/**
	 *	修改loan订单的投资状态
	 * @param
	 * @return
	 * @exception
	 */
	@Update("update loan_dd set cd_state='还款中' where loan_dd_id=#{loan_dd_id}")
	int updateState(String loan_dd_id);
	
	/**
	 *	修改借贷人的账户余额
	 * @param
	 * @return
	 * @exception
	 */
	@Update("update sq_user set account_balance=#{account_balance} where user_id=#{user_id}")
	int updateAccountBalance(SqUser sqUser);
	
	
	/**
	 *	根据用户id查询用户余额
	 * @param
	 * @return
	 * @exception
	 */
	@Select("select account_balance from  sq_user  where user_id=#{user_id}")
	BigDecimal getAccountBalance(String user_id);
	
	/**
	 *	修改loan订单的订单状态(同意--->筹款中)
	 * @param
	 * @return
	 * @exception
	 */
	@Update("update loan_dd set cd_state='筹款中' where cd_state='同意'")
	int updateCkState();
	
	
	
		
}
