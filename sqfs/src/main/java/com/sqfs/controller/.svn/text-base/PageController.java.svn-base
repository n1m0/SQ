package com.sqfs.controller;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sqfs.beans.Loan;
import com.sqfs.service.ProductService;

@Controller
@Scope("prototype")
@RequestMapping("/")
@Slf4j
public class PageController {
	
	@Autowired
	private  ProductService productService;
	
	/**   
	 * @作者 秦                                
	 * @日期 2017年11月7日
	 * @desc:主页面
	 */
	@RequestMapping("/index")
	public ModelAndView  index() {
		ModelAndView mv=new  ModelAndView();
		List<Loan> loanList=productService.getProList();
		log.info("loanList:"+loanList.size());
		productService.getYiTou(loanList);
		mv.addObject("loanList", loanList);
		mv.setViewName("index");
		return mv;
	}
	/**
	 *	用于页面跳转的
	 * @param
	 * @return
	 * @exception
	 */
	@RequestMapping("{index}/home")
	public String PersonalCenter(@PathVariable("index")String index){		
		return index;
	}
	
	/**
	 *	用于需登录后才能看到的页面
	 * @param
	 * @return
	 * @exception
	 */
	@RequestMapping("trans/{index}/home")
	public String EnterCenter(@PathVariable("index")String index){		
		return index;
	}

	/**
	 * 跳转常见问题
	 * @return
	 */
	@RequestMapping("c/faq")
	public String toFAQ() {
		return "FAQ";
	}
}
