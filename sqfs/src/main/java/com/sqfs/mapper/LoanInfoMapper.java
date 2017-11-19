package com.sqfs.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sqfs.beans.Loan;
import com.sqfs.beans.Repayment;
import com.sqfs.beans.SqUser;
import com.sqfs.beans.ZcInfo;

@Mapper
public interface LoanInfoMapper {
	
	/**
	 *	借贷时填写的个人信息,修改个人信息
	 * @param
	 * @return
	 * @exception
	 */
	@Update("update sq_user set  birthDate=#{birthDate},sex=#{sex},bank_card=#{bank_card},"
			+ "email=#{email},education=#{education},"
			+ "hy_status=#{hy_status},jj_name=#{jj_name},jj_name_phone=#{jj_name_phone},"
			+ "jj_name_rela=#{jj_name_rela},h_address=#{h_address},x_address=#{x_address},"
			+ "w_position=#{w_position},m_income=#{m_income},user_checked=#{user_checked}  "
			+ " where  user_id=#{user_id}")
	int updateSqUser(SqUser sqUser);
	
	/**
	 *	插入资产
	 * @param
	 * @return
	 * @exception
	 */
	@Insert("insert into zc_info (zc_id,user_id,zc_name,zc_code,zc_date,zc_luojia,zc_pinggujia,"
			+ "zc_djzheng,zc_xianzheng,zc_pingguzheng) values(#{zc_id},#{user_id},#{zc_name},"
			+ "#{zc_code},#{zc_date},#{zc_luojia},#{zc_pinggujia},#{zc_djzheng},"
			+ "#{zc_xianzheng},#{zc_pingguzheng})")
	int insertZcId(ZcInfo zcInfo);
	
	
	/**
	 *	修改个人资产(资产id在用户数据更新的时候生成,所以这里插入资产的全部信息,而不是根据id插入)
	 * @param
	 * @return
	 * @exception
	 */
	@Update("update zc_info  set zc_id=#{zc_id}, zc_name=#{zc_name},zc_code=#{zc_code},zc_date=#{zc_date},"
			+ "zc_luojia=#{zc_luojia},zc_pinggujia=#{zc_pinggujia}  "
			+ " where  zc_id=#{zc_id}")
	int addZc(ZcInfo zcInfo);
	
	
	/**
	 *	查询资产信息
	 * @param
	 * @return
	 * @exception
	 */
	@Select("select zc_id,zc_name,zc_code,zc_date,zc_luojia,zc_pinggujia from zc_info where zc_id=#{zc_id} ")
	ZcInfo queryZcInfo(String zc_id);
	
	
	
	/**
	 *	添加借贷订单(填写完,未审核的)
	 * @param
	 * @return
	 * @exception
	 */
	@Insert("insert into loan_dd (loan_dd_id,user_id,loan_money,loan_name,loan_date,"
			+ "loan_num,loan_type,rate_id,hk_type,loan_use,sh_level,dd_state,cd_state,"
			+ "min_money,tran_id,zc_id,commencement_date) values (#{loan_dd_id},#{user_id},#{loan_money},"
			+ "#{loan_name},sysdate(),sysdate(),#{loan_type},#{rate_id},#{hk_type},#{loan_use},"
			+ "#{sh_level},#{dd_state},#{cd_state},#{min_money},#{tran_id},#{zc_id},5)")
	int addLoanProduct(Loan loan);
	
	
	/**
	 *	添加还款信息,单个产品的(在service层写计算逻辑,这里直接写sql语句)
	 * @param
	 * @return
	 * @exception
	 */
	@Insert("insert into hk_table (tran_id,qishu,yh_benjin,yh_lixi,hk_state,"
			+ "yh_bx,dh_bx) values (#{tran_id},#{qishu},#{yh_benjin},#{yh_lixi},"
			+ "#{hk_state},#{yh_bx},#{dh_bx})")
	int addRepayment(Repayment repayment);
	
	
	
	@Select("select l.loan_dd_id,l.rate_id ,r.rate_id 'rate.rate_id',r.hk_time 'rate.hk_time',r.rate_num_l 'rate.rate_num_l',"
			+ "r.rate_num_i 'rate.rate_num_i' from loan_dd l,rate r where l.rate_id=r.rate_id and l.loan_dd_id=#{loan_dd_id}")
	Loan queryRate(Loan loan);
	
	
}
