package com.sqfs.service;

import java.io.InputStream;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import com.sqfs.beans.LikeResearch;
import com.sqfs.beans.Loan;
import com.sqfs.beans.ProcessDefinitionDto;

/**
 * 订单审核
 * @author LSZ
 */
public interface CheckOrderService {

	/**
	 * 部署流程定义
	 * @param zip 传入流程定义zip压缩文件
	 * @param processDefinitionName 流程定义名称
	 * @return ProcessDefintitionDto 返回流程部署定义信息列表
	 */
	List<ProcessDefinitionDto> deploymentProcessDefinition(ZipInputStream zip, String processDefinitionName);
	
	/**
	 * 开启流程实例并且完成申请的提交
	 * @param loanOrderId 订单号
	 */
	void startProcessInstanceAndSubmitApplication(String loanOrderId);
	
	/**
	 * 完成个人任务
	 * @param taskId 待完成的任务ID
	 * @param comment 审核人员的意见
	 * @param money 申请金额
	 */
	void completePersonalTask(String taskId, BigDecimal money,String firstChecker,String comment,String remark,String loan_dd_id);
	
	/**
	 * 查询个人的所有任务
	 * @param currentPage 当前页
	 * @return 返回任务集合
	 */
	List<Loan> findAllPersonalTask(LikeResearch likeResearch,int currentPage);

	
	/**
	 * 查询个人的所有历史任务
	 * @param request
	 * @param currentPage 当前页
	 * @return
	 */
	List<Loan> findAllPersonalHistoryTask(LikeResearch likeResearch,int currentPage);
	
	/**
	 * 获取任务坐标，显示当前任务执行到哪一步
	 * @param taskId
	 * @return 返回坐标位置集合
	 */
	Map<String, Integer> getTaskPosition(String taskId); 
	
	/**
	 * 分页查询部署信息
	 * @param currentPage 当前页
	 * @return 返回部署信息列表
	 */
	List<ProcessDefinitionDto> getAllProcessDefinitionInfo(int currentPage);
	
	/**
	 * 统计流程定义数量
	 * @param type 翻页类型,上一页还是下一页
	 * @return 返回流程定义的信息,包括总记录数,总页数,当前页数
	 */
	Map<String, Long> countProcessDefinition(String type);
	
	/**
	 * 删除流程定义
	 * @param deploymentId 流程定义id
	 */
	void deleteProcessDefinition(String deploymentId);
	
	/**
	 * 查看流程图
	 * @param deploymentId 部署id
	 * @return InputStream 返回流程定义输入流
	 */
	InputStream getProcessDefinitionPng(String deploymentId);
	
	/**
	 * 查询待审订单的详细信息
	 * @return loan 订单对象
	 * @author csh
	 * */
	Loan  queryOrderDetail(String orderId);
	
	/**
	 * 查询海是否含有正在审核的订单
	 * @return 如果存在则返回true,否则返回false
	 */
	boolean hasOrder();
}
