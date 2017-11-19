package com.sqfs.provider;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.util.StringUtils;

import com.sqfs.beans.ManagerInfo;

public class ManagerProvider {

	public String checkout(final ManagerInfo man){
		return new SQL(){
			{
				SELECT("e.g_id 'manId',e.g_name 'name',e.role_id 'roleId',e.operatorname 'operator',"
						+ "e.ope_time operateTime,e.g_pwd passWord,"
						+ "r.role_id 'role.roleId',r.role_name 'role.roleName',r.role_code 'role.roleCode',"
						+ "r.power_name 'role.powerName',r.power_info 'role.powerInfo'");
                FROM("sq_emp e,sq_role r");
                WHERE("e.role_id = r.role_id");
                if (!StringUtils.isEmpty(man.getManId()))
                {
                    WHERE("e.g_id = #{manId}");
                }
                if (!StringUtils.isEmpty(man.getName())){
                	WHERE("e.g_name = #{name}");
                }
                if(!StringUtils.isEmpty(man.getOperator())){
                	WHERE("e.operatorname = #{operator}");
                }
                if(!StringUtils.isEmpty(man.getOperateTime())){
                	WHERE("e.ope_time = #{operateTime}");
                }
                if(!StringUtils.isEmpty(man.getRoleId())){
                	WHERE("e.role_id = #{roleId}");
                }
			}	
		}.toString();
	}
}
