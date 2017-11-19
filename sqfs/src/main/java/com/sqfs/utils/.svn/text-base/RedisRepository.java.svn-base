package com.sqfs.utils;

import redis.clients.jedis.Jedis;

/**
 * 
 *
 * @author 秦英杰
 */
public final class RedisRepository {
	/**
	 * 
	 *	取对象数据
	 * @param key 对象的key
	 * @return 可能为空
	 * @exception
	 */
	public static Object getInfo(byte[] key,Jedis jedis) {
		byte[] b = jedis.get(key);
		if(b != null){
			Object obj =  DeepClone.restore(b);
			return obj;
		}
		return null;
	}
	
	/**
	 * 
	 *	取字符串
	 * @param str 字符串
	 * @return 
	 * @exception
	 */
	public static String getInfo(String str,Jedis jedis) {
		return jedis.get(str);
	}
	
	/**
	 * 
	 *	存对象
	 * @param  obj 数据库对象数据
	 * @param  str key
	 * @param  saveImmediately 是否立即保存
	 * @return
	 * @exception
	 */
	public static void  setInfo(Object obj, byte[] key, boolean saveImmediately,Jedis jedis) {
		jedis.set(key, DeepClone.writeInto(obj));
		
		if(saveImmediately) {
			jedis.save(); //dump.rdb 
		}
	}
	
	/**
	 * 
	 *	存储字符串
	 * @param
	 * @return
	 * @exception
	 */
	public static void  setInfo(String obj, String str, boolean saveImmediately,Jedis jedis) {
		jedis.set(str.getBytes(), DeepClone.writeInto(obj));
		
		if(saveImmediately) {
			jedis.save(); //dump.rdb 
		}
	}
	
	/**
	 *	删除字符串
	 * @param
	 * @return
	 * @exception
	 */
	public static void delInfo(String str,Jedis jedis) {
		jedis.del(str);
		
	}
	
	/**
	 *	删除对象
	 * @param
	 * @return
	 * @exception
	 */
	public static void delInfo(byte[] key,Jedis jedis) {
		jedis.del(key);
		
	}
	
}
