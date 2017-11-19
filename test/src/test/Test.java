package test;

import java.util.Calendar;


public class Test {
	public static void main(String[] args) {
		/*String str = MD5Util.encode2hex("123456");
		System.out.println(str);
		boolean a = str.equals(MD5Util.encode2hex("123456"));
		System.out.println(a);*/
		
		System.out.println(Math.random()*9); 
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MINUTE,5);
		System.out.println(calendar.getTime());
		
		
			
			String randomNumStr = "";
		    for(int i = 0; i < 6;i ++){
		        int randomNum = (int)(Math.random() * 10);
		        randomNumStr += randomNum;
		        System.out.println(randomNumStr);
		    }
		}
		
		
}
