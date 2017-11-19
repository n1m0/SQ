package com.sqfs.config;

import java.sql.SQLException;

import lombok.extern.slf4j.Slf4j;

import org.activiti.engine.HistoryService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.activiti.spring.SpringProcessEngineConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 配置流程引擎
 * @author lsz
 * 2017.11.1
 */
@Configuration
@EnableTransactionManagement
@Slf4j
public class ActivitiConfig{
	
	/**
	 * 通过注入DataSourceConfiguration获取Druid数据源以及事务管理
	 */
	@Autowired
	private DataSourceConfig configuration;

	/**
	 * 注入SpringProcessEngineConfiguration
	 * @return
	 * @throws SQLException 
	 */
	@Bean("processEngineConfiguration")
	@Primary
	public SpringProcessEngineConfiguration setSpringProcessEngineConfiguration() throws SQLException{
	    SpringProcessEngineConfiguration processEngineConfiguration = new SpringProcessEngineConfiguration();
	    //配置连接数据源	    
	    processEngineConfiguration.setDataSource(configuration.getDataSource());
	    //配置事务
	    processEngineConfiguration.setTransactionManager(configuration.setPlatformTransactionManager());
	    //activiti流程引擎表创建策略
	    processEngineConfiguration.setDatabaseSchemaUpdate(SpringProcessEngineConfiguration.DB_SCHEMA_UPDATE_TRUE);
		return processEngineConfiguration;
	}
	
	/**
	 * 配置ProcessEngineFactoryBean
	 * @return
	 */
	@Bean("processEngine")
	@Primary
	public ProcessEngineFactoryBean setProcessEngineFactory(){
		ProcessEngineFactoryBean processEngine = new ProcessEngineFactoryBean();
		try {
			processEngine.setProcessEngineConfiguration(setSpringProcessEngineConfiguration());
		} catch (SQLException e) {
			log.info("创建activiti的流程引擎失败,异常信息： {}", e);
		}
		return processEngine;
	} 
	
	/**
	 * 配置RepositoryService服务
	 * @return
	 */
	@Bean("repositoryService")
	@Primary
	public RepositoryService getRepositoryService(){
		return setProcessEngineFactory().getProcessEngineConfiguration().getRepositoryService();
	} 
	
	/**
	 * 配置RuntimeService服务
	 * @return
	 */
	@Bean("runtimeService")
	@Primary
	public RuntimeService getRuntimeService(){
		return setProcessEngineFactory().getProcessEngineConfiguration().getRuntimeService();
	}
	
	/**
	 * 配置TaskService服务
	 * @return
	 */
	@Bean("taskService")
	@Primary
	public TaskService getTaskService(){
		return setProcessEngineFactory().getProcessEngineConfiguration().getTaskService();
	}
	
	/**
	 * 配置HistoryService服务
	 * @return
	 */
	@Bean("historyService")
	@Primary
	public HistoryService getHistoryService(){
		return setProcessEngineFactory().getProcessEngineConfiguration().getHistoryService();
	}
	
	/**
	 * 配置ManagementService服务
	 * @return
	 */
	@Bean("managementService")
	@Primary
	public ManagementService getManagementService(){
		return setProcessEngineFactory().getProcessEngineConfiguration().getManagementService();
	}

}
