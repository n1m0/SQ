package com.sqfs.config.bean;

import lombok.Data;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * redis连接池配置属性
 * @author LSZ on 2017.11.4
 */
@Data
@ConfigurationProperties(prefix="spring.redis")
public class RedisProperties {

	/**连接端口号*/
	private int port;
	
	/**连接URL*/
	private String host;
	
	/**最大空闲连接数*/
	private int maxIdle;
	
	/**最大连接数*/
	private int maxTotal;
	
	/**获取连接时最大等待时间，单位毫秒*/
	private long maxWait;
	
	/**申请连接时执行validationQuery检测连接是否有效*/
	private boolean testOnBorrow;
}
