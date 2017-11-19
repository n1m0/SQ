package com.sqfs.beans;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 流程定义和部署对应的实体类
 * @author LSZ
 */
@Data 
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ProcessDefinitionDto {

	 private String id;
	 
	 private String key;
	 
	 private String name;
	 
	 private int version;
	 
	 private String deploymentTime;
}
