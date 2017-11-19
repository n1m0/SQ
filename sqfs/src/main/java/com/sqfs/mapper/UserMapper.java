package com.sqfs.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sqfs.beans.SqUser;

@Mapper
public interface UserMapper {

	/**
	 * 用户登录
	 * @param sqUser
	 * @return
	 * @author Administrator
	 */
	@Select("select user_id, phone, d_pwd,user_name , bank_card,account_balance , "
	 +"id_card,t_name ,birthDate ,sex,email,"
	 +"education,hy_status,h_address,x_address,w_position,m_income,w_year,"
	 +"jj_name,jj_name_phone,jj_name_rela,id_card_z,id_card_f,hukouben,jiehunzheng,work_info,"
	 +"liushuizhang,zhengxin,shang_time ,user_checked  from sq_user where phone=#{phone} and d_pwd=#{d_pwd}")
	SqUser login(SqUser sqUser);
	
	/**
	 * 用户注册时手机号码验证
	 * @param sqUser
	 * @return sqUser
	 * @author Administrator
	 */
	@Select("select user_id , phone, d_pwd from sq_user where phone=#{phone}")
	SqUser YZphone(String phone);
	
	
	/**   
	 * 注册用户
	 * @param 
	 * @return  
	 * @作者 邓                               
	 * @日期 2017年11月9日
	 */
	
	@Insert("insert into sq_user (user_id,phone,d_pwd ,user_name) values (#{user_id},#{phone},#{d_pwd} ,#{user_name})")
	int register(SqUser sqUser);
	
	
	/**   
	 * 修改密码
	 * @param 
	 * @return  
	 * @作者 邓                               
	 * @日期 2017年11月9日
	 */
	@Update("UPDATE sq_user SET d_pwd = #{d_pwd} WHERE phone = #{phone}")
	int alterPassword(SqUser sqUser);
	
	
	
}
