package com.sqfs.utils;

import java.util.HashMap;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;


/**
 *	分页对象
 * @author 秦英杰(on 上午10:42:22)
 * @see
 * @version
 */
@Slf4j
public class PageUtil {
	
	//当前页
	public static int currentPage;
	//每页多少条
	public static int pageSize;
	//总页数
	public static int totalPage;
	//总条数
	public static int totalNum;
	public static Map<String, String > map=new HashMap<String,String>();	
	public static PageUtil myUtil;
	private  PageUtil(){
		if(currentPage==0){
			currentPage=1;
		}
		if(pageSize==0){
			pageSize=3;
		}
		
		if(totalNum%pageSize==0){
			totalPage=totalNum/pageSize;
		}else{
			totalPage=totalNum/pageSize+1;
		}	
		
	}
	
	public static void init(){
		myUtil=new PageUtil();
	}
	
	//查询订单统计分页处理
	public static Map<String, Integer> pagination(int totleCount) {
		int currentPage = 1;
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		if(totleCount == 0) {
			map.put("totlepage", 0);
			map.put("currentPage", 0);
			map.put("totleCount", 0);
			SqfsSessionContext.push("orderStatisticPageInfo", map);
			return map;
		}
		
		int totlepage = 0;
		if(totleCount > 5) {
			if(totleCount % 5 == 0) {
				totlepage = totleCount / 5;
			} else {
				totlepage = totleCount / 5 + 1;
			}
		} else {
			totlepage = 1;
		}
		
		//把分页信息存储到session中
		map.put("totlepage", totlepage);
		map.put("currentPage", currentPage);
		map.put("totleCount", totleCount);
		log.debug("-------------->>>测试测试, {}", map);
		SqfsSessionContext.push("orderStatisticPageInfo", map);
		return map;
	}
	
	/**
	 * 用当前页计算下一页
	 * @param type 执行上下翻页
	 * @param currentPage 当前页
	 * @return
	 */
	public static int pagination(String type, int currentPage) {
		int page = 0;
		switch (type) {
		case "上一页":
			currentPage --;
			page = currentPage;
			break;

		case "下一页":
			currentPage ++;
			page = currentPage;
			break;
		}
		return page;
	}
}
