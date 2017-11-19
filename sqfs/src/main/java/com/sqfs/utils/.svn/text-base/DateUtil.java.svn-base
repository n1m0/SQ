package com.sqfs.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
/**
 * 
* @Description: TODO(获取某刻的时间) 
* @author 丁振兴
 */
public class DateUtil {
	//日期格式化(年-月-日)
	static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    
	static Calendar c = Calendar.getInstance();
	public static Date afterTime(Date date,int days,int months,int years){
		c.setTime(date);
		if(days != 0){
			c.add(Calendar.DATE, days);
		}
		if(months != 0){
			c.add(Calendar.MONTH, months);
		}
		if(years != 0){
			c.add(Calendar.YEAR, years);
		}
		String str = format.format(date);
		try {
			date = format.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	/**
	 * 获取days天以后的日期
	 * @param days
	 * @return
	 */
	public static Date afterDays(int days){
		c.setTime(new Date());
		c.add(Calendar.DATE, days);
		Date date = c.getTime();
		String str = format.format(date);
		try {
			date = format.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date ; 
	}
	/**
	 * 获取months个月后的日期
	 * @param months
	 * @return
	 */
	public static Date afterMonths(int months){
		c.setTime(new Date());
		c.add(Calendar.MONTH, months);
		Date date = c.getTime();
		String str = format.format(date);
		try {
			date = format.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	/**
	 * 获取years年后的日期
	 * @param years
	 * @return
	 */
	public static Date afterYears(int years){
		c.setTime(new Date());
		c.add(Calendar.YEAR, years);
		Date date = c.getTime();
		String str = format.format(date);
		try {
			date = format.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	/**
	 * @Description 获取今天0时刻
	 * @return Date
	 * @exception ParseException
	 *
	 */
	public Date getDay(){
		Date date =new Date();
		String str = format.format(date);//格式化日期，只显示年月日  例:2017-11-11
		try {
			date = format.parse(str);//转换成日期格式
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	/**
	 * 
	 * @Description 获取一周前的0时刻
	 * @return Date
	 * @exception ParseException
	 *
	 */
	public Date getAgoWeek(){
		c.setTime(new Date());
        c.add(Calendar.DATE, - 7);
        Date date = c.getTime();
        String day = format.format(date);
        System.out.println("过去七天："+day);
        try {
			date = format.parse(day);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	/**
	 * 
	 * @Description 获取一个月前的0时刻(加今天是7天,不加今天是六天前的0时刻)
	 * @return Date
	 * @exception ParseException
	 *
	 */
	public Date getOneMonth(){
		c.setTime(new Date());
        c.add(Calendar.MONTH, -1);
        Date date = c.getTime();
        String mon = format.format(date);
        System.out.println("过去一个月："+mon);
        try {
			date = format.parse(mon);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	/**
	 * 
	 * @Description 获取三个月前的0时刻
	 * @return Date
	 * @exception ParseException
	 *
	 */
	public Date getThreeMonth(){
		c.setTime(new Date());
        c.add(Calendar.MONTH, -3);
        Date date = c.getTime();
        String mon = format.format(date);
        System.out.println("过去三个月："+mon);
        try {
			date = format.parse(mon);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	/**
	 * 
	 * @Description 获取六个月前的0时刻
	 * @return Date
	 * @exception ParseException
	 *
	 */
	public Date getSixMonth(){
		c.setTime(new Date());
        c.add(Calendar.MONTH, -6);
        Date date = c.getTime();
        String mon = format.format(date);
        System.out.println("过去六个月："+mon);
        try {
			date = format.parse(mon);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	
	/**
	 * 
	 * @Description 获取六个月前的0时刻
	 * @return Date
	 * @exception ParseException
	 *
	 */
	public Date getOneYear(){
		c.setTime(new Date());
        c.add(Calendar.YEAR, -1);
        Date date = c.getTime();
        String year = format.format(date);
        System.out.println("过去一年："+year);
        try {
			date = format.parse(year);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	 /** 
     * 两个时间之间相差距离多少天 
     * @param one 时间参数 1： 
     * @param two 时间参数 2： 
     * @return 相差天数 
     */  
    public static long getDistanceDays(String str1, String str2) throws Exception{  
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
        Date one;  
        Date two;  
        long days=0;  
        try {  
            one = df.parse(str1);  
            two = df.parse(str2);  
            long time1 = one.getTime();  
            long time2 = two.getTime();  
            long diff ;  
            if(time1<time2) {  
                diff = time2 - time1;  
            } else {  
                diff = time1 - time2;  
            }  
            days = diff / (1000 * 60 * 60 * 24);  
        } catch (ParseException e) {  
            e.printStackTrace();  
        }  
        return days;  
    } 
    
    /**
	 * 
	 * @Description 获取n个月后的0时刻
	 * @return Date
	 * @exception ParseException
	 *
	 */
	public static Date getMonth(int n){
		c.setTime(new Date());
        c.add(Calendar.MONTH, +n);
        Date date = c.getTime();
        String mon = format.format(date);
        System.out.println("过去六个月："+mon);
        try {
			date = format.parse(mon);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
  /**
	 * 获取当前时间 的时间戳
	 * @Description 
	 * @return Date
	 * @exception ParseException
	 *
	 */
	public static String newDate(){
		String date = System.currentTimeMillis()+"";// new Date()为获取当前系统时间，也可使用当前时间戳
		
		return date;
		
	}
	
	
}
