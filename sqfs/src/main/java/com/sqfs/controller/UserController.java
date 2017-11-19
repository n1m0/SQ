package com.sqfs.controller;




import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import redis.clients.jedis.Jedis;

import com.sqfs.beans.SqUser;
import com.sqfs.service.UserService;



@Slf4j
@Controller
@Scope("prototype")
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	Jedis jedis;
	
	
	@RequestMapping("/image")
	public String  image() {
		return "image";
	}
	
	@RequestMapping("/index")
	public String  index() {
		return "index";
	}
	
	/**   
	 * 用户登录
	 * @作者 邓                                
	 * @日期 2017年11月9日
	 * 
	 */
	@RequestMapping("/login")
	@ResponseBody
	public Map<String ,Object> login(String password,HttpServletResponse response,HttpServletRequest request,String phone,String mima,HttpSession session ){
		Map<String ,Object> yz=new HashMap<String ,Object>();
		
		SqUser sqUser=new SqUser();
		sqUser.setPhone(phone);
		sqUser.setD_pwd(password);
		sqUser=userService.login(sqUser);
	
		if(sqUser!=null){
			log.info("已登录");
			session.setAttribute("info", sqUser);//将登录状态放入session中
			
			if("yes".equals(mima)){
				Cookie nameCookie = new Cookie("phone",phone);  
		        nameCookie.setMaxAge(60*60);//1小时  
		        response.addCookie(nameCookie);  
		        nameCookie.setPath("/");//设置cookie保存路径
				
		        Cookie pwdCookie = new Cookie("pwd",password);  
		        pwdCookie.setMaxAge(60*60);//1小时  
		        response.addCookie(pwdCookie);  
		        pwdCookie.setPath("/");//设置cookie保存路径 
		        
			}
			yz.put("msg", "yes");
		}
		return yz;
	}
	
	/**   
	 * 用户注册,验证手机号码是否注册过
	 * @param phone 手机号
	 * @return Map<String ,Object> map集合
	 * @作者 邓                               
	 * @日期 2017年11月8日
	 */
	@RequestMapping("YZphone")
	@ResponseBody
	public  Map<String ,Object> YZphone(String phone){
		Map<String ,Object> yz=new HashMap<String ,Object>();
		SqUser useryz=userService.YZphone(phone);
		if(useryz==null){
			yz.put("msg", "未注册");
		}else{
			yz.put("msg", "已注册");
		}
		return yz;
	}
	
	/**   
	 * 图片验证码生成类
	 * @param 
	 * @return json Map<String ,Object> map集合
	 * @作者 邓                               
	 * @日期 2017年11月8日
	 */
	//生成验证码图片  
	@RequestMapping("valicode") //对应/user/valicode.do请求  
	@ResponseBody
	public Map<String ,Object> valicode(HttpSession session ,String rands) throws Exception{  
		String rand=(String) session.getAttribute("BSVCODE_IN_SESSION");
		Map<String ,Object> yz=new HashMap<String ,Object>();
		if(rands.equals(rand)){
			yz.put("msg", "yes");
		}else{
			yz.put("msg", "no");
		}
		return yz;   
	}  
	
	/**   
	 * 注册账号
	 * @param 
	 * @return String 
	 * @作者 邓                               
	 * @日期 2017年11月9日
	 */
	@RequestMapping("register")
	@ResponseBody
	public Map<String ,Object> register(String password,String phone) {
		Map<String ,Object> yz=new HashMap<String ,Object>();
		if(password!=null&&phone!=null){
			SqUser sqUser=new SqUser();
			sqUser.setPhone(phone);
			sqUser.setD_pwd(password);
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			sqUser.setUser_id(uuid);
			
			String user_name = phone.replaceAll("(\\d{3})\\d{4}(\\d{4})", "$1****$2");  
			
			//String date= DateUtil.newDate();//去工具类中获取是时间戳
			//String user_name=date.substring(date.length()-6);//截取最后面的6位字段
			//user_name="SQ_"+user_name;//加SQ
			sqUser.setUser_name(user_name);
			int a=userService.register(sqUser);
			if(a>0){
				yz.put("msg", "y");//写入成功
			}else{
				yz.put("msg", "n");//注册失败
			}
		}else{
			yz.put("msg", "1");//手机号或密码为空
		}
		return yz;
	}
	
	/**   
	 * 注销账号
	 * @param 
	 * @return  
	 * @作者 邓                               
	 * @日期 2017年11月9日
	 */
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.removeAttribute("info"); 
		return "login";
	}
	
	/**   
	 * 修改密码
	 * @param 
	 * @return  
	 * @作者 邓                               
	 * @日期 2017年11月9日
	 */
	
	@RequestMapping("alterPassword")
	@ResponseBody
	public Map<String ,Object> alterPassword(String password,String phone) {
		Map<String ,Object> yz=new HashMap<String ,Object>();
		if(password!=null&&phone!=null){
			SqUser sqUser=new SqUser();
			sqUser.setPhone(phone);
			sqUser.setD_pwd(password);
			
			int a=userService.alterPassword(sqUser);
			if(a>0){
				yz.put("msg", "y");//写入成功
			}else{
				yz.put("msg", "n");//注册失败
			}
		}else{
			yz.put("msg", "1");//手机号或密码为空
		}
		return yz;
	}
}
