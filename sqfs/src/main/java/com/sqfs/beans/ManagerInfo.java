package com.sqfs.beans;



import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 管理员信息实体类
 * @author zwl
 * @date 2017年11月9日下午2:03:18
 */
@Data  //注解在类上；提供类所有属性的 getting 和 setting 方法，此外还提供了equals、canEqual、hashCode、toString 方法 
@AllArgsConstructor//注解在类上；为类提供一个全参的构造方法 
@NoArgsConstructor //注解在类上；为类提供一个无参的构造方法 
@Builder
@ToString
public class ManagerInfo {	
	/**id，即用户名、登录名、工号*/
	private String manId;
	/**管理员姓名*/
	private String name;
	/**管理员角色*/
	private Role role;
	/**管理员信息录入、修改操作人*/
	private String operator;
	/**管理员信息录入、修改操作时间*/
	@DateTimeFormat( pattern = "yyyy-MM-dd")
	private Date operateTime;
	/**登录密码*/
	private String passWord;
	/**管理员角色id*/
	private String roleId;
	
}
