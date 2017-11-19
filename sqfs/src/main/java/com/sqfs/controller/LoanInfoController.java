package com.sqfs.controller;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sqfs.beans.Loan;
import com.sqfs.beans.SqUser;
import com.sqfs.beans.ZcInfo;
import com.sqfs.service.CheckOrderService;
import com.sqfs.service.LoanInfoService;
import com.sqfs.utils.PicUtil;
import com.sqfs.utils.SqfsSessionContext;
import com.sqfs.utils.UuidUtil;



@Controller
@Scope("prototype")
@RequestMapping("/loan")
@Slf4j
public class LoanInfoController {
	
	@Autowired
	private LoanInfoService loanInfoService;
	
	@Autowired
	private CheckOrderService checkOrderService;
	
	/**
	 * 完善个人信息
	 * @param sqUser
	 * @return ModelAndView
	 * @exception 
	 */
	@RequestMapping("updateSqUser")
	public ModelAndView updateSqUser(SqUser sqUser,String birthDate1,ModelAndView mv,String province1,String city1
			,String town1 ,String province,String city,String town){
				//对日期进行转化(字符串转日期)
			log.info("squser+++++"+sqUser);
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
				java.util.Date birthDate=null;
				try {
					birthDate = sdf.parse(birthDate1);
				} catch (ParseException e) {
					e.printStackTrace();
				}  
				sqUser.setBirthDate(birthDate);
		String uuid =UuidUtil.getUuid();
		province1=province1 + city1;
		province1=province1+town1;
		sqUser.setH_address(province1);//拼接户籍所在地
		province=province+city;
		province=province+town;
		sqUser.setX_address(province);
		sqUser.setUser_checked(1);
		//修改squser
		int a=loanInfoService.updateSqUser(sqUser);
		
		if(a>0){
			//更新session
			SqfsSessionContext.push("info", sqUser);
			mv.setViewName("redirect:/trans/PersonalCenter/getPensonalInformation/" + sqUser.getUser_id());
		}else {
			mv.addObject("error", "修改失败");
			mv.setViewName("loan3");
		}
		return mv;
	}
	
	
	
	/**
	 *	用ajax判断订单是否存在,存在不可提交,不存在可以提交,生成loan订单
	 * @param
	 * @return
	 * @exception
	 */
	@RequestMapping("/resultMeg")
	public @ResponseBody Map userLogin(){
		
		Map<String, String> parMap=new HashMap<String,String>();
		if(checkOrderService.hasOrder()){
			parMap.put("meg", "success");
		}
		parMap.put("meg", "error");
		return parMap;
	}
	
	/**
	 *	添加loan订单产品,并添加还款信息到还款表,同时启动实例,
	 * @param
	 * @return
	 * @exception
	 */
	@RequestMapping("/addLoanPro")
	public ModelAndView  addLoanPro(Loan loan){
		ModelAndView mv=new ModelAndView();
		SqUser sqUser=(SqUser)SqfsSessionContext.pop("info");
		//借贷订单id
		loan.setLoan_dd_id(UuidUtil.getUuid());
		//用户id
		loan.setUser_id(sqUser.getUser_id());
		//审核级别
		int  loanMoney=loan.getLoan_money().intValue();
		//判断审核级别
		if(loanMoney>5000){
			loan.setSh_level("二级审核");
		}else {
			loan.setSh_level("一级审核");
		}
		//起投金额
		BigDecimal bd100=new BigDecimal(100);
		loan.setMin_money(bd100);
		//生成还款表的主键id
		loan.setTran_id(UuidUtil.getUuid());
		//生成资产表的主键
		loan.setZc_id(UuidUtil.getUuid());
		//添加loan订单
		int	flag=loanInfoService.addLoanProduct(loan);
		 if (flag>0) {
			 //添加还款信息
			 int repay=loanInfoService.addRepayment(loan);
				if (repay>0) {
					mv.addObject("loan",loan );
					mv.setViewName("loan4");
				}
		}
		return  mv;
	}
	
	
	
	/**
	 * 添加资产信息
	 * @param sqUser
	 * @return ModelAndView
	 * @exception 
	 */
	@RequestMapping("/addZc")
	public String addZc(ZcInfo zcInfo,HttpServletRequest request,String zc_date1,HttpSession 
			session,String loan_dd_id,@RequestParam("zc_djzheng1") MultipartFile zc_djzheng1,
			@RequestParam("zc_xianzheng1")MultipartFile zc_xianzheng1,@RequestParam
			("zc_pingguzheng1")MultipartFile zc_pingguzheng1){
		
		//调用工具类上传文件(3个文件)
		zcInfo.setZc_djzheng(PicUtil.getPicName(zc_djzheng1, request));
		zcInfo.setZc_xianzheng(PicUtil.getPicName(zc_xianzheng1, request));
		zcInfo.setZc_pingguzheng(PicUtil.getPicName(zc_pingguzheng1, request));
		SqUser sqUser=(SqUser) SqfsSessionContext.pop("info");
		zcInfo.setUser_id(sqUser.getUser_id());
		//对日期进行转化(字符串转日期)
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		java.util.Date zc_date=null;
		try {
			zc_date = sdf.parse(zc_date1);
		} catch (ParseException e) {
			e.printStackTrace();
		}  
		zcInfo.setZc_date(zc_date);
		//添加资产信息
		int b=loanInfoService.insertZcId(zcInfo);
		if(b>0){
			//启动实例
			checkOrderService.startProcessInstanceAndSubmitApplication(loan_dd_id);
			return "index";
		}
		return "error";
	}
	
	
	/**
	 *	下载图片测试
	 * @param picPath 文件名称,带后缀
	 * @param request 请求
	 * @param response 写出的时候需要
	 */
	@RequestMapping("/load/{picPath}/pic")
	public void loadPic(@PathVariable("picPath") String picPath,HttpServletRequest request,
			HttpServletResponse response){
		
		PicUtil.loanPic(picPath, request, response);
	}
	
	
	
}
