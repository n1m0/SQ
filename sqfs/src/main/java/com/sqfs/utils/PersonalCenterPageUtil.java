package com.sqfs.utils;

import java.util.HashMap;
import java.util.Map;


/**
 * 
* @Description: 分页工具
* @author 丁振兴
 */
public class PersonalCenterPageUtil {

	public static int totalPage;//总页码
	public static int currentPage;//当前页码
	public static int totalNum;//总条数
	public static int startNum;//每页起始条数
	public static int endNum;//每页结尾条数
	public static int showRows;//每页显示条数
	public static Map<String, String>map=new HashMap<String, String>();
	public static PersonalCenterPageUtil pageUtil;
	//初始化
	public static void init(){
		pageUtil=new PersonalCenterPageUtil();
	} 
	private PersonalCenterPageUtil(){
		if(currentPage==0){//设置当前页码
			currentPage=1;
		}
		if(showRows==0){//设置每页条数
			showRows=5;
		}
		//设置总页码
		if(totalNum==0){
			totalPage=1;
		}else if(totalNum%showRows>0){
			totalPage=totalNum/showRows+1;
		}else if(totalNum%showRows==0){
			totalPage=totalNum/showRows;
		}
		startNum=showRows*currentPage-showRows;//设置起始条数
	}
	
}
