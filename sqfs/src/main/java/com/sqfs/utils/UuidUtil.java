package com.sqfs.utils;

import java.util.UUID;
public final class UuidUtil {
	
	private UuidUtil() {}
	
	
	/**
	 *	uuid生成
	 * @param
	 * @return
	 * @exception
	 */
	public static String getUuid() {
		String uuid= UUID.randomUUID().toString().replaceAll("-", "");
		return  uuid;
	}
	
}
