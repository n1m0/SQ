package com.sqfs.service.impl;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;

import com.sqfs.service.PersonalCenterEmailService;
import com.sqfs.utils.MD5Util;

@Service
public class PersonalCenterEmailServiceImpl implements PersonalCenterEmailService{
	@Autowired
	private JavaMailSender mailSender; //自动注入的Bean
	
	@Value("${spring.mail.username}")
	private String Sender; //读取配置文件中的参数
	
	@Autowired
	Jedis jedis;
	
	/**
	 * 注册邮箱
	 * user_id  用户名
	 * email  邮箱地址
	 */
	@Override
	public boolean processregister(String email,String user_id) {
		
		MimeMessage message = null;
        try {
            message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(Sender);
            helper.setTo(email);
            helper.setSubject("SQ金服:第三方功能邮箱绑定!");
            
            //32位随机验证码
            String validateCode = MD5Util.encode2hex(email);
            //存入redis中
            jedis.set("validateCode", validateCode);
            jedis.pexpire("validateCode", 60*60*24*1*1000L);
            jedis.set("email", email);
            jedis.pexpire("email", 60*60*24*2L);
            //发送邮件
            StringBuffer sb = new StringBuffer();
            sb.append("<h1>SQ金服:第三方功能邮箱绑定!</h1>")
                    .append("<p style='color:red;font-size:20px'>"
                    		+ "<a href='http://127.0.0.1:8899/sq/trans/PersonalCenter/PersonalCenterEmail/"
                    		+ user_id
                    		+ "/activate/"
                    		+ validateCode
                    		+ "?email="
                    		+email
                    		+ "'>点击验证</a></p>");
            helper.setText(sb.toString(), true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mailSender.send(message);
	    return true;
	    
	    
	}

	/**
	 * 
	 * email  邮箱地址
	 * validateCode  验证码
	 */
	@Override
	public boolean processActivate(String email, String validateCode) {
		System.out.println("email:"+jedis.get("email"));
		System.out.println("validateCode:"+jedis.get("validateCode"));
		boolean a = email.equals(jedis.get("email"));
		boolean b = validateCode.equals(jedis.get("validateCode"));
		if(a == true && b ==true){
			return true;
		}
		return false;
	}
}
