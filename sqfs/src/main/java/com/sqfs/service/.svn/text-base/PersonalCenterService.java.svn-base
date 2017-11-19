package com.sqfs.service;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.PathVariable;

import com.sqfs.beans.Loan;
import com.sqfs.beans.SqUser;

/**
 * 
* @ClassName: PersonalCenterService 
* @Description: TODO(PersonalCenterService接口) 
* @author 丁振兴
* @date 2017年11月7日 下午4:25:58 
 */
public interface PersonalCenterService {
	
	public SqUser getSqUser(String user_id);
	/**
	 * 
	 * @Description 通过用户id获取用户的所有借贷订单
	 * @param user_id 用户id
	 * @return List<Loan> 借贷订单集合
	 *
	 */
	public List<Loan> getLoansByUserId(String user_id);
	/**
	 * 
	 * @Description 通过用户id获取用户的所有投资订单
	 * @param user_id 用户id
	 * @return List<Invest> 投资订单集合
	 *
	 */
	public SqUser getInvestByUserId(String user_id);
	/**
	 * 
	 * @Description 通过id获取借贷订单
	 * @param loan_dd_id 借贷订单id
	 * @return Loan 借贷对象
	 *
	 */
	public Loan getLoansByLoan_dd_id(String loan_dd_id);
	/**
	 * 
	 * @Description 通过用户id获取用户资金记录集合
	 * @param user_id 用户id
	 * @return List<MoneyRecord> 资金记录集合
	 *
	 */
	public SqUser getMoneyRecordTypeAndDate(String user_id,String trade_type,String trade_date,int page);
	/**
	 * 
	 * @Description 通过用户id获取用户的所有投资订单
	 * @param user_id 用户id
	 * @return List<Invest> 投资订单集合
	 *
	 */
	public SqUser getInvestsIngByUserId(String user_id);
	/**
	 * 充值
	 * @param card
	 * @param money
	 * @param user_id
	 * @return
	 */
	public boolean Recharge(String card,BigDecimal money,String user_id,String str);
	/**
	 * 提现
	 * @param money
	 * @param user_id
	 * @return
	 */
	public boolean Withdraw(String bankCard,BigDecimal money,String user_id);
	/**
	 * 添加邮箱
	 * @param user_id
	 * @param email
	 * @return
	 */
	public boolean addEmail(String user_id,String email);
	
	/**
	 * 添加真实姓名和身份证
	 * @param modelAndView
	 * @param user_id
	 * @param user_name
	 * @param id_card
	 * @return
	 */
	public boolean addIDCard(@PathVariable("user_id")String user_id,String t_name,String id_card );
	/**
	 * 逻辑删除投资记录
	 * @param tz_dd_id
	 */
	public boolean deleteInvest(@Param("tz_dd_id")String tz_dd_id);
	
	/**
	 * 修改手机号
	 * @param user_id
	 * @param phone
	 * @return
	 */
	public boolean updatePhone(String user_id,String phone);
}
