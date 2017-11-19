package com.sqfs.beans;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;



/**
 * 管理员角色对象实体
 * @author zwl
 * @date 2017年11月10日下午7:21:05
 */
@Data  //注解在类上；提供类所有属性的 getting 和 setting 方法，此外还提供了equals、canEqual、hashCode、toString 方法 
@AllArgsConstructor//注解在类上；为类提供一个全参的构造方法 
@NoArgsConstructor //注解在类上；为类提供一个无参的构造方法 
@Builder
@ToString
public class Role {
	private String	roleId;//角色id
	private String	roleName;//角色
	private String	roleCode;//角色标识
	private String	powerName;//权限
	private String	powerInfo;//权限描述

}
