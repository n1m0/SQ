package com.sqfs.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import com.sqfs.config.bean.RedisProperties;

/**
 * 配置redis连接
 * @author LZS on 2017.11.4
 */
@Configuration
@EnableConfigurationProperties(RedisProperties.class)
public class RedisConfig {
	
	@Autowired
	private RedisProperties redisProperties;
	
	/**
	 * redis连接池配置
	 * @return 
	 */
	@Bean
	public JedisPoolConfig setJedisPoolConfig(){
		JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
		jedisPoolConfig.setMaxIdle(redisProperties.getMaxIdle());
		jedisPoolConfig.setMaxTotal(redisProperties.getMaxTotal());
		jedisPoolConfig.setMaxWaitMillis(redisProperties.getMaxWait());
		jedisPoolConfig.setTestOnBorrow(redisProperties.isTestOnBorrow());
		return jedisPoolConfig;
	}

	/**
	 * 设置连接池
	 * @return
	 */
	@Bean
	public JedisPool setJedisPool(){
		JedisPool jedisPool = 
				new JedisPool(setJedisPoolConfig(), redisProperties.getHost(), redisProperties.getPort());
		return jedisPool;
	}
	
	/**
	 * 注入Jedis对象
	 * @return
	 */
	@Bean
	public Jedis setJedis(){
		Jedis jedis = setJedisPool().getResource();
		return jedis;
	}

}
