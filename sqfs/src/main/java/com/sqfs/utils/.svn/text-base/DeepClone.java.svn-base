package com.sqfs.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import lombok.extern.slf4j.Slf4j;



/**
 * 对象和二进制转换工具类(参考: 深度克隆). 把一个对象存入redis的缓存的时候需要把对象(要求对象实现序列化接口)转成二进制数组,
 * 从redis缓存中吧数据取出的时候是一个二进制数据组对象, 所以需要把二进制数据转换成原来的对象.
 * @author LSZ
 */
@Slf4j
public final class DeepClone {

	private DeepClone() {}
	
	/**
	 * 把对象转变成二进制
	 * @param obj 待转换的对象
	 * @return 返回二进制数组
	 */
	public static byte[] writeInto(Object obj) {
		ByteArrayOutputStream bos = null;
		ObjectOutputStream oos = null;
		try {
			bos = new ByteArrayOutputStream();
			oos = new ObjectOutputStream(bos);
			//读取对象并转换成二进制数据
			oos.writeObject(obj);
			return bos.toByteArray();
		} catch (IOException e) {
			log.warn("对象转换成二级制数据失败, {}", e);
		} finally {
			if(oos != null) {
				try {
					oos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(bos != null) {
				try {
					bos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	} 
	
	/**
	 * 把二进制数组的数据转回对象
	 * @param b
	 * @return
	 */
	public static Object restore(byte[] b) {
		ByteArrayInputStream bis = null;
		ObjectInputStream ois = null;
		try {
			//读取二进制数据并转换成对象
			bis = new ByteArrayInputStream(b);
			ois = new ObjectInputStream(bis);
			return ois.readObject();
		} catch (ClassNotFoundException | IOException e) {
			log.warn("二进制数据转回对象失败, {}", e);
		} finally {
			if(ois != null) {
				try {
					ois.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(bis != null) {
				try {
					bis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
}
