package com.sqfs.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sqfs.beans.Invest;
import com.sqfs.beans.Loan;
import com.sqfs.beans.SqUser;
import com.sqfs.service.ProductService;
import com.sqfs.utils.PageUtil;
import com.sqfs.utils.UuidUtil;
/**
 *	投资控制层
 * @author 秦英杰(on 上午10:42:22)
 * @see
 * @version
 */
@Controller
@Scope("prototype")
@RequestMapping("/invest")
@Slf4j
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/login")
	private String login(){
		return "index";
	}
	
	/**
	 *	点击我要投资,投资产品列表,
	 * @param
	 * @return
	 * @exception
	 */
	@RequestMapping("/investList")
	public ModelAndView productList(String currentPage,String loan_type,String  rate_num_i,String rate_id) {
		Map<String,String > parMap=new HashMap<String, String>();
		parMap.put("rate_num_i",rate_num_i );
		parMap.put("rate_id",rate_id );
		PageUtil.map=parMap;
		if(currentPage==null || "".equals(currentPage)){
			currentPage="1";
		}
		PageUtil.currentPage=Integer.parseInt(currentPage);
		PageUtil.pageSize=3;
		Loan loan=new Loan();
		loan.setLoan_type(loan_type);
		int  num=productService.queryTotleList(loan);
		log.info("num====="+num);
		PageUtil.totalNum=num;
		PageUtil.init();
		//用于得到投资产品列表
		List<Loan> loanList=productService.queryProList(loan);
		log.info("number====="+loanList.size());
		//List<Loan> products=productService.productList();
		//用于得到投资产品当前已投金额,为了求投标进度
		productService.getYiTou(loanList);
		ModelAndView mv=new ModelAndView();
		mv.addObject("currentPage",currentPage);
		mv.addObject("loanList",loanList);
		mv.addObject("rate_num_i",rate_num_i);
		mv.addObject("rate_id",rate_id);
		mv.addObject("loan_type",loan.getLoan_type());
		mv.setViewName("list");
			return mv;
	}
	
	/**
	 *	通过借贷订单id得到当前借贷产品的投资情况
	 * @param
	 * @return
	 * @exception
	 */
	@RequestMapping("/getInvestsListByLoanId")
	public ModelAndView getInvestsListByLoanId(HttpSession session,String loan_dd_id,String currentPage) {
		if(currentPage==null || "".equals(currentPage)){
			currentPage="1";
		}
		PageUtil.currentPage=Integer.parseInt(currentPage);
		PageUtil.pageSize=3;
		int  num=productService.getTotleInvestNum(loan_dd_id);
		PageUtil.totalNum=num;
		log.info("==============="+num);
		PageUtil.init();
		//通过借贷订单id得到当前借贷产品的借贷情况
		Loan loan=productService.getLoansByLoanId(loan_dd_id);
		 //通过借贷订单id得到当前借贷产品的投资情况
		 List<Invest> investsList=productService.getInvestsListByLoanId(loan);
		 log.info("loan==============="+loan);
		String token =UuidUtil.getUuid();//创建令牌
		session.setAttribute("token",token );
		ModelAndView mv=new ModelAndView();
		mv.addObject("currentPage",currentPage);
		mv.addObject("loan",loan);
		mv.addObject("investsList",investsList);
		mv.setViewName("infor");
		return mv;
	}
	
	/**
	 *	投标
	 * @param
	 * @return
	 * @exception
	 */
	@RequestMapping("/add")
	public String oneInvest(Invest invest,HttpSession session,String token) {
	String token2=(String) session.getAttribute("token");
		if (token.equals(token2)) {
			session.removeAttribute("token");
			//先要得到当前登录人
			SqUser sqUser=(SqUser) session.getAttribute("info");
			BigDecimal dqye=new BigDecimal(0.00);
			BigDecimal account_balance=new BigDecimal(0.00);
			account_balance=sqUser.getAccount_balance();
			BigDecimal tz_money=new BigDecimal(0.00);
			tz_money=invest.getTz_money();
			dqye=account_balance.subtract(tz_money);
			invest.setDqye(dqye);//余额
			invest.setUser_id(sqUser.getUser_id());//用户id
			sqUser.setAccount_balance(dqye);//设置user里面的当前余额
			int a=productService.add(invest);
			if (a>0) {
				int b=productService.updateDqye(sqUser);
				if (b>0) {
					return "forward:/invest/getInvestsListByLoanId?"+invest.getLoan_dd_id();
				}else {
					return "error";
				}
			}else {
				return "index";
			}
		}
		return  "forward:/invest/getInvestsListByLoanId?"+invest.getLoan_dd_id();
	}
}
