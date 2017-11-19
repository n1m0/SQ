package com.sqfs.config.bean;

import lombok.Data;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * 映射yaml配置文件中的Druid数据源配置属性。
 * @author lsz
 * 2017.11.1
 */
@Data
@ConfigurationProperties(prefix="spring.druid")
public class DruidDataSourceProperties {
	
	/**初始化时建立物理连接的个数*/
	private int initialSize;
	
	/**最大连接池数量*/
	private int maxActive;
	
	/**最小连接池数量*/
	private int minIdle;
	
	/**获取连接时最大等待时间，单位毫秒*/
	private long maxWait;
	
	/**配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒*/
	private long timeBetweenEvictionRunsMillis;
	
	/**配置一个连接在池中最小生存的时间，单位是毫秒*/
	private long minEvictableIdleTimeMillis;
	
	/**
	 * 用来检测连接是否有效的sql，要求是一个查询语句(MySQL的查询语句为select 1)。 
	 * 如果validationQuery为null，testOnBorrow、testOnReturn、 
     * testWhileIdle都不会其作用。
	 */
	private String validationQuery;
	
	/**
	 * 申请连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能。默认值为TRUE
	 */
	private boolean testOnBorrow;
	
	/**归还连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能。默认值为FALSE*/
	private boolean testOnReturn;
	
	/**建议配置为true，不影响性能，并且保证安全性。*/
	private boolean testWhileIdle;
	
	/**
	 * 是否缓存preparedStatement，也就是PSCache。 PSCache对支持游标的数据库性能提升巨大，比如说oracle。 
	 * 在mysql5.5以下的版本中没有PSCache功能，建议关闭掉。作者在5.5版本中使用PSCache，通过监控界面发现PSCache有缓存命中率记录， 
	 * 该应该是支持PSCache。
	 */
	private boolean poolPreparedStatements;
	
	/**缓存PSCache的大小*/
	private int maxPoolPreparedStatementPerConnectionSize;
	
}
