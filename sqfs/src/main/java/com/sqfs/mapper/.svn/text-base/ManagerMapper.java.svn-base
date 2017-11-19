package com.sqfs.mapper;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Insert;
import java.util.Map;



import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import com.sqfs.beans.Loan;
import com.sqfs.beans.ManagerInfo;
import com.sqfs.beans.OrderIdTaskID;
import com.sqfs.beans.Repayment;
import com.sqfs.beans.Role;
import com.sqfs.beans.SqUser;
import com.sqfs.beans.ZcInfo;
import com.sqfs.provider.ManagerProvider;
import com.sqfs.provider.QueryOrderProvider;


/**
 * 管理员信息查询 mapper
 * @author zwl
 * @date 2017年11月9日下午12:09:44
 */

@Mapper
public interface ManagerMapper {
	
	/**
	 * 修改管理员角色id
	 * @author 曾伟林
	 * @param roleId
     * @param manId
	 * @return Integer
	 */
	@Update("update sq_emp set role_id=#{roleId},ope_time=#{opeTime} where g_id=#{manId}")
	Integer updateRoleIdOfMan(@Param("roleId")String roleId,@Param("opeTime")Date opeTime,@Param("manId")String manId);
	
	/**
	 * 根据角色标识查询角色id
	 * @author 曾伟林
	 * @param roleCode
	 * @return String
	 */
	@Select("select role_id from sq_role where role_code=#{roleCode}")
	String findRoleIdbyRoleCode(@Param("roleCode")String roleCode);
	
	/**
	 * 根据角色名查询角色信息
	 * @author 曾伟林
	 * @param roleId
	 * @return Role
	 */
	@Select("select * from sq_role where role_code=#{roleCode}")
	@Results({
		@Result(id=true,property="roleId",column="role_id"),
		@Result(property="roleName",column="role_name"),
		@Result(property="roleCode",column="role_code"),
		@Result(property="powerName",column="power_name"),
		@Result(property="powerInfo",column="power_info"),
	})
	Role findRolebyCode (@Param("roleCode") String roleCode);
	
	/**
	 * 修改当前管理员密码
	 * @author 曾伟林
	 * @return
	 */
	@Update("update sq_emp set g_pwd=#{nPword} where g_id=#{manId}")
	Integer updatePword(@Param("nPword")String nPword,@Param("manId")String manId);
	
	/**
	 * 新增管理员
	 * @author 曾伟林
	 * @return
	 */
	@Insert("insert into sq_emp (g_id,g_name,role_id,operatorname,ope_time,g_pwd)"
			+ "values (#{manId},#{name},#{roleId},#{operator},#{operateTime},#{passWord})")
	Integer addMan(ManagerInfo man);
	
	/**
	 * 通过id（用户名）查看管理员信息
	 * @author 曾伟林
	 * @param manId
	 * @return ManagerInfo
	 */
	@Select("select * from sq_emp where g_id=#{manId}")
	@Results({
		@Result(id=true,property="manId",column="g_id"),
		@Result(property="name",column="g_name"),
		@Result(property="operator",column="operatorname"),
		@Result(property="operateTime",column="ope_time"),
		@Result(property="passWord",column="g_pwd"),
		@Result(property="role",column="role_id",
			one=@One(select="com.sqfs.mapper.ManagerMapper.findRolebyId"))
	})
	ManagerInfo findManbyId(@Param("manId")String manId);
	
	
	/**
	 * 查询所有管理员信息
	 * @author 曾伟林
	 * @return ManagerInfo
	 */
	@Select("select * from sq_emp")
	@Results({
		@Result(id=true,property="manId",column="g_id"),
		@Result(property="name",column="g_name"),
		@Result(property="operator",column="operatorname"),
		@Result(property="operateTime",column="ope_time"),
		@Result(property="passWord",column="g_pwd"),
		@Result(property="role",column="role_id",
			one=@One(select="com.sqfs.mapper.ManagerMapper.findRolebyId"))
	})
	List<ManagerInfo> findAllMan();
	
	/**
	 * 动态查询管理员信息
	 * @author 曾伟林
	 * @param man
	 * @return
	 * @throws
	 */
	@SelectProvider(type=ManagerProvider.class,method="checkout")
	List<ManagerInfo> findManDynamic (ManagerInfo man);
	

	/**
	 * 根据角色id查询
	 * @author 曾伟林
	 * @param roleId
	 * @return Role
	 * @throws
	 */
	@Select("select * from sq_role where role_id=#{roleId}")
	@Results({
		@Result(id=true,property="roleId",column="role_id"),
		@Result(property="roleName",column="role_name"),
		@Result(property="roleCode",column="role_code"),
		@Result(property="powerName",column="power_name"),
		@Result(property="powerInfo",column="power_info"),
	})
	Role findRolebyId (@Param("roleId") String roleId);
	
	/**
	 * 根据角色名查询角色信息
	 * @author 曾伟林
	 * @param roleId
	 * @return Role
	 * @throws
	 */
	@Select("select * from sq_role where role_name=#{roleName}")
	@Results({
		@Result(id=true,property="roleId",column="role_id"),
		@Result(property="roleName",column="role_name"),
		@Result(property="roleCode",column="role_code"),
		@Result(property="powerName",column="power_name"),
		@Result(property="powerInfo",column="power_info"),
	})
	Role findRolebyName (@Param("roleName") String roleName);
		
	/**
	 * 增加Taskid
	 * @author csh
	 * */
	@Update("update loan_dd set taskid=#{taskID} where loan_dd_id=#{orderID}")
	void updateTaskid(OrderIdTaskID orderIdTaskID);
	
	/**
	 * 查询未审核订单的信息
	 * @author csh
	 * @return Loan
	 * */
	@Select("select ld.loan_dd_id,ld.taskid,ld.loan_money,hk.tran_id,sq.user_id,"
			+ "ld.loan_name,ld.loan_date,ld.user_id,"
			+ "ld.hk_type,ld.loan_use,ld.sh_level,"
			+ "ld.dd_state,ld.sp_time1,ld.sp_time2,ld.g_id,ld.g_id2,"
			+ "ld.remark1,ld.remark2,ld.zc_id "
			+ "from loan_dd ld,sq_user sq ,hk_table hk,zc_info z "
			+ "where ld.user_id=sq.user_id and hk.tran_id=ld.tran_id and z.zc_id=ld.zc_id "
			+ "and ld.loan_dd_id=#{orderid}")
	@Results({
		@Result(id=true,property="loan_dd_id",column="loan_dd_id",javaType=String.class),
		@Result(property="user_id",column="user_id",javaType=String.class),
		@Result(property="taskid",column="taskid",javaType=String.class),
		@Result(property="loan_money",column="loan_money",javaType=BigDecimal.class),
		@Result(property="loan_name",column="loan_name",javaType=String.class),
		@Result(property="loan_date",column="loan_date",javaType=Date.class),
		@Result(property="hk_type",column="hk_type",javaType=String.class),
		@Result(property="loan_use",column="loan_use",javaType=String.class),
		@Result(property="sh_level",column="sh_level",javaType=String.class),
		@Result(property="dd_state",column="dd_state",javaType=String.class),
		@Result(property="sp_time1",column="sp_time1",javaType=Date.class),
		@Result(property="sp_time2",column="sp_time2",javaType=Date.class),
		@Result(property="g_id",column="g_id",javaType=String.class),
		@Result(property="g_id2",column="g_id2",javaType=String.class),
		@Result(property="remark1",column="remark1",javaType=String.class),
		@Result(property="remark2",column="remark2",javaType=String.class),
		@Result(property="sqUser",column="user_id", javaType=SqUser.class,	
				one=@One(select="com.sqfs.mapper.ManagerMapper.getUserInfo")),
		@Result(property="repayment",column="tran_id",javaType=Repayment.class,
				one=@One(select="com.sqfs.mapper.ManagerMapper.getRepayment")),
		@Result(property="zcInfo",column="zc_id",javaType=ZcInfo.class,
				one=@One(select="com.sqfs.mapper.ManagerMapper.getFinance"))
			
	})
	Loan queryOrderDetail(String orderid);
			
	/**
	 * 查询用户信息
	 * @author csh
	 * */	
	@Select(" select user_id,phone,d_pwd,user_name,"
			+ "bank_card,account_balance,user_pic,"
			+ "t_name,id_card,z_pwd,"
			+ "birthDate,sex,"
			+ "email,education,hy_status,"
			+ "h_address,x_address,w_position,"
			+ "m_income,w_year,jj_name,"
			+ "jj_name_phone,jj_name_rela,id_card_z,"
			+ "id_card_f,hukouben,jiehunzheng,"
			+ "work_info,liushuizhang,zhengxin,"
			+ "shang_time from sq_user where user_id=#{user_id}")		
		SqUser  getUserInfo(String user_id);
	
	/**
	 * 查询还款对象
	 * @author csh
	 * */
	@Select("select qishu,yh_benjin,yh_lixi,yh_bx,dh_bx from hk_table "
			+ "where tran_id=#{tran_id}")
	Repayment  getRepayment(@Param("tran_id") String tran_id);
	
	/**
	 *客户提交订单更新订单状态 
	 *@author csh
	 */
	@Update("update loan_dd set cd_state=#{status},loan_date=now()  where loan_dd_id=#{loan_dd_id}")
	void updateUncheckOrderStatusById(@Param("loan_dd_id") String loan_dd_id, @Param("status") String status);
	 
	/**
	 * 一审之后订单状态更新 
	 * @author csh
	 */
	@Update("update loan_dd set dd_state=#{comment},remark1=#{remark},g_id=#{checker},sp_time1=now() where loan_dd_id=#{loan_dd_id}")
	void update1OrderStatusById(@Param("loan_dd_id") String loan_dd_id,@Param("comment") String comment,
			@Param("remark") String remark,@Param("checker") String checker);
	
	/**
	 *二审之后订单状态更新 
	 * @author csh
	 */
	@Update("update loan_dd set dd_state=#{comment},remark2=#{remark},g_id2=#{checker},sp_time2=now() where loan_dd_id=#{loan_dd_id}")
	void update2OrderStatusById(@Param("loan_dd_id") String loan_dd_id,@Param("comment") String comment,
			@Param("checker") String checker,@Param("remark") String remark);

	/**
	 *动态指定审核人 
	 *@author csh
	 *@param currentActivityId 当前活动ID 
	 */
	@Select("select g_name name from  sq_emp se,sq_role sr where se.role_id=sr.role_id and sr.role_name=#{currentActivityId} limit 1")
	String distributeChecker(String currentActivityId);
					
	/**
	 * 查询订单信息
	 * @author csh
	 * @return ManagerInfo
	 */
	@SelectProvider(type=QueryOrderProvider.class,method="queryOrders")
	List<Loan> getLoansByloan_dd(Map<?, ?> orderInfo);	
	
	/**
	 * 查询总订单数
	 * @author csh
	 * @return int
	 * */
	@SelectProvider(type=QueryOrderProvider.class,method="getCount")
	int getCount(Map<?, ?> orderInfo);
	
	@Select("select zc_id,user_id,zc_name,zc_code,zc_date,zc_luojia,zc_pinggujia,zc_djzheng,"
			+ "zc_xianzheng,zc_pingguzheng from zc_info where zc_id=#{zc_id}")
	ZcInfo getFinance(@Param("zc_id") String zc_id);
	
}
