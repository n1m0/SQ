package com.sqfs.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.bind.RelaxedPropertyResolver;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.alibaba.druid.pool.DruidDataSource;
import com.sqfs.config.bean.DruidDataSourceProperties;

/**
 * 配置Druid数据源。
 * @author lsz
 * 2017.11.1
 */
@Configuration
@EnableTransactionManagement
@EnableConfigurationProperties(DruidDataSourceProperties.class)
@MapperScan("com.sqfs.mapper")//用于映射dao接口
public class DataSourceConfig implements EnvironmentAware {

	@Autowired
	private DruidDataSourceProperties dataSource;
	
	/**读取yaml中属性值*/
	private Environment environment;
	private RelaxedPropertyResolver propertyResolver;
	
	public void setEnvironment(Environment environment) {
		this.environment = environment;
		//获取yaml中spring.datasource.*的值
		this.propertyResolver = new RelaxedPropertyResolver(this.environment, "spring.datasource.");
	}
	
	/**
	 * 设置Druid数据源连接属性
	 * @return
	 */
	@Bean(initMethod = "init", destroyMethod = "close")
	@Primary
	public DruidDataSource getDataSource(){
		DruidDataSource ds = new DruidDataSource();
		//基本属性配置
		ds.setUrl(propertyResolver.getProperty("url"));
		ds.setDriverClassName(propertyResolver.getProperty("driver-class-name"));
		ds.setUsername(propertyResolver.getProperty("username"));
		ds.setPassword(propertyResolver.getProperty("password"));
		//连接池属性
		ds.setInitialSize(dataSource.getInitialSize());
		ds.setMaxActive(dataSource.getMaxActive());
		ds.setMinIdle(dataSource.getMinIdle());
		ds.setMaxWait(dataSource.getMaxWait());
		ds.setTimeBetweenEvictionRunsMillis(dataSource.getTimeBetweenEvictionRunsMillis());
		ds.setMinEvictableIdleTimeMillis(dataSource.getMinEvictableIdleTimeMillis());
		ds.setValidationQuery(dataSource.getValidationQuery());
		ds.setTestOnBorrow(dataSource.isTestOnBorrow());
		ds.setTestOnReturn(dataSource.isTestOnReturn());
		ds.setTestWhileIdle(dataSource.isTestWhileIdle());
		ds.setPoolPreparedStatements(dataSource.isPoolPreparedStatements());
		ds.setMaxPoolPreparedStatementPerConnectionSize(dataSource.getMaxPoolPreparedStatementPerConnectionSize());

		return ds;
	}
	
	/**
	 * 配置SqlSessionFactory
	 * @return
	 * @throws Exception
	 */
	@Bean
	@Primary
	public SqlSessionFactory setSqlSessionFactory() throws Exception{
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setDataSource(getDataSource());
		return bean.getObject();
	}
	
	/**
	 * 事务管理
	 * @return
	 */
	@Bean("druidTransactionManager")
	@Primary
	public PlatformTransactionManager setPlatformTransactionManager(){
		return new DataSourceTransactionManager(getDataSource());
	}
}
