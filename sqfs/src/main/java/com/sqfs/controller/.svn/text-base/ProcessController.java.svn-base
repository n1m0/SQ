package com.sqfs.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sqfs.beans.LikeResearch;
import com.sqfs.beans.Loan;
import com.sqfs.beans.ProcessDefinitionDto;
import com.sqfs.service.CheckOrderService;
import com.sqfs.service.OrderHandlerService;
import com.sqfs.utils.SqfsSessionContext;


@Controller
@Scope("prototype")
@RequestMapping("/backStage")
@Slf4j
public class ProcessController {	
	@Autowired
	private  CheckOrderService checkOrderService;
	@Autowired
	private  OrderHandlerService orderHandlerService;		
	
	@InitBinder("likeResearch")
	public void initBinder(WebDataBinder binder){
		binder.setFieldDefaultPrefix("likeResearch.");		
	}
	
	/**
	 * zip压缩文件上传
	 * @author 陈绍华
	 * @param zipDocs 文件对象  /processDefinitionName 流程名
	 * @return mv
	 */
	@RequestMapping("/m/uploadProcessDocument")
	public String  uploadProcessDocument(ModelAndView mv,@RequestParam MultipartFile zipDocs,
												String processDefinitionName,
												HttpServletRequest req)
	{			
		ZipInputStream zip = null;
		try {
			zip = new ZipInputStream(zipDocs.getInputStream());//转化为Zip格式的文件流
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		List<ProcessDefinitionDto> pdto=checkOrderService.deploymentProcessDefinition(zip, processDefinitionName);
		Map<String, Long> pdInfo = checkOrderService.countProcessDefinition("默认");
		SqfsSessionContext.push("process", pdto);
		SqfsSessionContext.push("pdInfo", pdInfo);
		return "bactivity";
	}
	
	/**
	 * 流程权限管理
	 * @author 陈绍华
	 * @return bactivity
	 */
	@RequestMapping("/m/bactivity")
	public String activity(){	
		//加载流程定义信息
		List<ProcessDefinitionDto> list = checkOrderService.getAllProcessDefinitionInfo(1);
		Map<String, Long> pdInfo = checkOrderService.countProcessDefinition("默认");
		SqfsSessionContext.push("process", list);
		SqfsSessionContext.push("pdInfo", pdInfo);
		return "bactivity";
	}	
	/**
	 * 查看未审订单集合列表
	 * @author 陈绍华
	 * @return bunviewOrder
	 */
	@RequestMapping("/m/bunviewOrder")
	public ModelAndView unviewOrder(ModelAndView mv,LikeResearch likeResearch,String currentPage){							
		if(currentPage==null||"".equals(currentPage)){
			currentPage="1";
		}
		if(likeResearch.getComment()==null){
			likeResearch.setComment("");
		}
		if(likeResearch.getLikeorderid()==null){
			likeResearch.setLikeorderid("");
		}
		SqfsSessionContext.push("unviewSearch",likeResearch);
		
		
		int pageNum=Integer.parseInt(currentPage);	
		List<Loan> loans=checkOrderService.findAllPersonalTask(likeResearch,pageNum);				
		mv.addObject("loans", loans);
		mv.setViewName("bunviewOrder");
		return mv;
	}
	
	/**
	 * 展示已审订单窗口
	 * @author 陈绍华
	 * @return bviewedOrder
	 */
	@RequestMapping("/m/bviewedOrder")
	public ModelAndView viewedOrder(String currentPage,ModelAndView mv,LikeResearch likeResearch){
		
		if(currentPage==null||"".equals(currentPage)){
			currentPage="1";
		}
		if(likeResearch.getComment()==null||"请选择".equals(likeResearch.getComment())){
			likeResearch.setComment("");
		}
		if(likeResearch.getLikeorderid()==null||"".equals(likeResearch.getLikeorderid())){
			likeResearch.setLikeorderid("");
		}
		SqfsSessionContext.push("viewedSearch",likeResearch);
		
		
		int pageNum=Integer.parseInt(currentPage);			
		List<Loan> loans=checkOrderService.findAllPersonalHistoryTask(likeResearch,pageNum);
		mv.addObject("loans",loans);
		mv.setViewName("bviewedOrder");
		return mv;
	}	
	
	/**
	 * 查看流程定义orderDetail
	 * @return
	 */
	@RequestMapping("/m/v/{deploymentId}")
	public String viewProcessDefinition(
			@PathVariable(value = "deploymentId") String deploymentId, HttpServletResponse response) {
		//获取部署流程图资源
		InputStream in = checkOrderService.getProcessDefinitionPng(deploymentId);
		OutputStream out = null;
		try {
			out = response.getOutputStream();
			byte[] b = new byte[1024];
			 for (int len = -1; (len= in.read(b))!=-1; ) {
	                out.write(b, 0, len);
	         }
		} catch (IOException e) {
			log.error("获取部署流程图失败, 错误信息为: {}", e.getMessage());
		} finally {
			if(out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	/**
	 * 查看待审订单的详细信息 
	 * @author csh
	 */
	@RequestMapping("/m/uncheckOrderDetail/{loan_dd_id}")
	public ModelAndView  queryOrderDetail(@PathVariable("loan_dd_id") String loan_dd_id,ModelAndView mv){
		Loan loan=checkOrderService.queryOrderDetail(loan_dd_id);
		mv.setViewName("bcheckingOrder");
		mv.addObject("loan",loan);
		return mv;
	}
	
	/**
	 * 审核订单
	 * @author csh
	 */
	@RequestMapping("/m/checkingOrder")
	public String checkingOrder(String remark,String comment,
							String loanMoney,String taskid,String firstChecker,
							String loan_dd_id)
	{
		BigDecimal money=new BigDecimal(loanMoney);
		checkOrderService.completePersonalTask(taskid,money,firstChecker,comment,remark,loan_dd_id);
		//审核完成跳转到未审核订单列表界面
		return "redirect:/backStage/m/bunviewOrder";
	}
	
	/**
	 *查看订单详细信息 
	 * @author csh
	 * @param loan_dd_id
	 * @return Loan
	 */
	@RequestMapping("/m/orderDetail/{loan_dd_id}")
	public ModelAndView  orderDetail(@PathVariable("loan_dd_id") String loan_dd_id,ModelAndView mv){
		Loan loan=checkOrderService.queryOrderDetail(loan_dd_id);
		mv.addObject("loan", loan);
		mv.setViewName("borderDetails");
		return mv;
	}	
}
