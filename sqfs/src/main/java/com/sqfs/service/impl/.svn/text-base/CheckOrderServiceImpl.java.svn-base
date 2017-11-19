package com.sqfs.service.impl;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import org.activiti.engine.HistoryService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqfs.beans.LikeResearch;
import com.sqfs.beans.Loan;
import com.sqfs.beans.ManagerInfo;
import com.sqfs.beans.OrderIdTaskID;
import com.sqfs.beans.ProcessDefinitionDto;
import com.sqfs.beans.SqUser;
import com.sqfs.mapper.ManagerMapper;
import com.sqfs.service.CheckOrderService;
import com.sqfs.service.OrderHandlerService;
import com.sqfs.utils.SqfsSessionContext;

/**
 * 订单审核实现类
 * @author LSZ 
 */

@Service
public class CheckOrderServiceImpl implements CheckOrderService {

	private static final String MANAGER_IN_SESSION = "MANAGER_IN_SESSION";
	//用户信息
	private static final String CUSTOMER_IN_SESSION = "info";	
	
	@Autowired
	RepositoryService repositoryService;
	@Autowired
	RuntimeService runtimeService;
	@Autowired
	TaskService taskService;
	@Autowired   
	HistoryService historyService;	
	@Autowired
	OrderHandlerService orderHandlerService;
	@Autowired
	ManagerMapper managerMapper;
	
	//部署流程实例
	public List<ProcessDefinitionDto> deploymentProcessDefinition(ZipInputStream zip, String processDefinitionName) {
		//部署流程实例
		repositoryService
			.createDeployment()
			.name(processDefinitionName)
		    .addZipInputStream(zip)
		    .deploy();		
		return getAllProcessDefinitionInfo(1);	
	}

	/**
	 * 启动流程实例并且提交申请
	 */
	public void startProcessInstanceAndSubmitApplication(String loanOrderId) {
		//启动流程实例
		String processDefinitionKey = Loan.class.getSimpleName(); 
		Map<String, Object> variables = new HashMap<String, Object>();
		SqUser user = (SqUser) SqfsSessionContext.pop(CUSTOMER_IN_SESSION);
		variables.put("appliciant", user.getT_name());
		//设置businessKey
		String businessKey = processDefinitionKey + "." + loanOrderId; 
		runtimeService.startProcessInstanceByKey(processDefinitionKey, businessKey, variables);
		
		//查询并执行个人任务
		Task task = taskService.createTaskQuery()
					.taskAssignee(user.getT_name())
					.singleResult();
		String taskId = task.getId();
		taskService.complete(taskId);		
		//指定任务办理人		
		
		//更新订单状态
		String status = "审核中";
		orderHandlerService.updateOrderStatusById(loanOrderId, status);

		//orderHandlerService.updateOrderStatusById(loanOrderId, status);
	}

	/**
	 * 管理员任务
	 */
	public void completePersonalTask(String taskId, BigDecimal money,String firstChecker, String comment,String remark,String loan_dd_id) {
		//完成审核任务
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("comment", comment);
		variables.put("money", money);
		Task task = taskService.createTaskQuery()
								.taskId(taskId)
								.singleResult();		
		String processInstanceId = task.getProcessInstanceId();	
		taskService.complete(taskId, variables);							
						
		//更新订单状态
		ManagerInfo manager=(ManagerInfo) SqfsSessionContext.pop(MANAGER_IN_SESSION);
		String checker=manager.getName();		
		if(firstChecker!=null&&!"".equals(firstChecker)){
			orderHandlerService.update2OrderStatusById(loan_dd_id,comment,checker,remark);				
		}else{		
			orderHandlerService.update1OrderStatusById(loan_dd_id,comment,checker,remark);
		}
		
		//判断流程是否已经结束，如果流程结束需要更新状态
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
						.processInstanceId(processInstanceId)
						.singleResult();
		String status="同意";
		if(comment.equals("驳回")){
			status="驳回";
		}
		if(processInstance==null) {//如果流程已经结束,更新客户订单状态					
			orderHandlerService.updateOrderStatusById(loan_dd_id,status);			
		}
}
	
	/**
	 * 分页查询代办任务
	 * @author 陈绍华
	 */
	public List<Loan> findAllPersonalTask(LikeResearch likeResearch,int currentPage) {
		//从session中获取管理员的信息
		ManagerInfo manager = (ManagerInfo) SqfsSessionContext.pop(MANAGER_IN_SESSION);
		String assignee = manager.getName();	
		//查询所有待办任务
		List<Task> list = taskService.createTaskQuery()
							.taskAssignee(assignee)
							.orderByTaskCreateTime()
							.asc()
							.list();	
		
		//从任务中获得订单集合
		List<OrderIdTaskID> orderlist=new ArrayList<OrderIdTaskID>();
		List<String> orders=new ArrayList<String>();
		List<Loan> loans=new ArrayList<Loan>();
		Map<String,Object> unviewOrders=new HashMap<String,Object>();
		Map<String,Object> orderInfo=new HashMap<String,Object>();
		//判断任务集合是否为空						
		if(list.size()>0){//不为空的情况下,查询得到任务ID集合
			for(Task task:list){
				ProcessInstance pi =runtimeService.createProcessInstanceQuery()					 										         				                
					                 .processInstanceId(task.getProcessInstanceId())					
					                 .singleResult();			
				OrderIdTaskID ot=new OrderIdTaskID();	
				String orderdd=pi.getBusinessKey();
				String orderid=orderdd.split("\\.")[1];			
				String Taskid=task.getId();
				orders.add(orderid);
				ot.setOrderID(orderid);
				ot.setTaskID(Taskid);
				orderlist.add(ot);		
			}
			//得到任务ID集合之后,往loan表格中增加对应的taskID
			for(OrderIdTaskID orderIdTaskID:orderlist){
				managerMapper.updateTaskid(orderIdTaskID);
			}
			//模糊查询条件放到Map中
			orderInfo.put("likeResearch", likeResearch);
			orderInfo.put("orders",orders);			
			//获得模糊查询的订单总数
			int totalSize=managerMapper.getCount(orderInfo);
			int pageSize=5;//每页显示的数量
			int totalPage=1;//默认为第一页
				if(totalSize%pageSize==0){
					totalPage=totalSize/pageSize;
				}else{
					totalPage=totalSize/pageSize+1;
				}
			//设置分页条件	
			int startSize=(currentPage-1)*5;
			unviewOrders.put("totalSize", totalSize);
			unviewOrders.put("currentPage", currentPage);
			unviewOrders.put("totalPage", totalPage);
			SqfsSessionContext.push("unviewOrders", unviewOrders);
			
			orderInfo.put("startSize", startSize);
			orderInfo.put("pageSize", pageSize);
			//查询符合分页条件的订单集合
			loans=managerMapper.getLoansByloan_dd(orderInfo);
		}else{				
			
			unviewOrders.put("totalSize", 0);
			unviewOrders.put("totalPage", 0);
			unviewOrders.put("currentPage",0);
			SqfsSessionContext.push("unviewOrders", unviewOrders);						
			return null;
	}				
		return loans;
	}
		
	/**
	 * 查询个人所有历史任务
	 * @author 陈绍华
	 */
	public List<Loan> findAllPersonalHistoryTask(LikeResearch likeResearch,int currentPage) {
		//从session中获取管理员的信息
		ManagerInfo manager = (ManagerInfo) SqfsSessionContext.pop(MANAGER_IN_SESSION);
		
		String assignee = manager.getName();
		//查询个人所有历史任务
		List<HistoricTaskInstance> list = historyService.createHistoricTaskInstanceQuery()
						.taskAssignee(assignee)
						.finished()
						.orderByTaskCreateTime()
						.asc()
						.list();					
		
		List<String> orders=new ArrayList<String>();
		List<Loan> loans=new ArrayList<Loan>();
		Map<String,Object> viwedOrders=new HashMap<String,Object>();
		Map<String,Object> orderInfo=new HashMap<String,Object>();
		
		//从任务中获得订单集合				
		if(list.size()>0){
			for(HistoricTaskInstance task:list){				
				HistoricProcessInstance hpi=historyService.createHistoricProcessInstanceQuery()
										.processInstanceId(task.getProcessInstanceId())
										.singleResult();	
				String businesskey=hpi.getBusinessKey();
				String orderid=businesskey.split("\\.")[1];				
				orders.add(orderid);
					}
			//模糊查询条件放到Map中
			orderInfo.put("likeResearch", likeResearch);
			orderInfo.put("orders",orders);			
			//获得模糊查询的订单总数
			int totalSize=managerMapper.getCount(orderInfo);
			int pageSize=5;//每页显示的数量
			int totalPage=1;//默认为第一页
				if(totalSize%pageSize==0){
					totalPage=totalSize/pageSize;
				}else{
					totalPage=totalSize/pageSize+1;
				}
			//设置分页条件	
			int startSize=(currentPage-1)*5;
			viwedOrders.put("totalSize", totalSize);
			viwedOrders.put("currentPage", currentPage);
			viwedOrders.put("totalPage", totalPage);
			SqfsSessionContext.push("checkedOrders", viwedOrders);
			
			orderInfo.put("startSize", startSize);
			orderInfo.put("pageSize", pageSize);
			//查询符合分页条件的订单集合
			loans=managerMapper.getLoansByloan_dd(orderInfo);			
		}else{
			return null;
		}
		return loans;
	}

	public Map<String, Integer> getTaskPosition(String taskId) {
		//获取任务
		Task task = taskService.createTaskQuery()
								.taskId(taskId)
								.singleResult();
		//获取流程定义实体
		String processDefinitionId = task.getProcessDefinitionId();
		ProcessDefinitionEntity entity = (ProcessDefinitionEntity) repositoryService.getProcessDefinition(processDefinitionId);
		
		//获取所有
		List<ActivityImpl> list = entity.getActivities();
		
		//获取执行对象
		String executionId = task.getExecutionId();
		Execution execution = runtimeService.createExecutionQuery()
						.executionId(executionId)
						.singleResult();
		//获取活动坐标
		Map<String, Integer> pos = new HashMap<String, Integer>();
		
		//获取当前活动ID
		String activityId = execution.getActivityId();
		for(ActivityImpl act : list) {
			if(act.getId().equals(activityId)) {
				//获取活动坐标
				pos.put("x", act.getX());
				pos.put("y", act.getY());
				pos.put("width", act.getWidth());
				pos.put("height", act.getHeight());
				break;
			}
		}
		
		return pos;
	}

	public List<ProcessDefinitionDto> getAllProcessDefinitionInfo(int currentPage) {
		//查询有所的流程定义信息
		int maxResults = 5;
		int firstResult = (currentPage - 1) * 5;		
		//获取部署信息
		List<Deployment> deployments = repositoryService.createDeploymentQuery()
							.orderByDeploymenTime()
							.orderByDeploymentName()
							.asc()
							.listPage(firstResult, maxResults);
		//组织部署信息
		List<ProcessDefinitionDto> dtos = new ArrayList<ProcessDefinitionDto>();
		for(Deployment d : deployments) {
			//获取部署id
			String deploymentId = d.getId();
			ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
								.deploymentId(deploymentId)
								.singleResult();
			//信息组织
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String deploymentTim = format.format(d.getDeploymentTime());
			ProcessDefinitionDto dto = ProcessDefinitionDto.builder()
							.id(d.getId())
							.name(d.getName())
							.key(processDefinition.getKey())
							.version(processDefinition.getVersion())
							.deploymentTime(deploymentTim)
							.build();
			dtos.add(dto);
		}					
		
		return dtos;
	}

	//统计流程定义信息
	@SuppressWarnings("unchecked")
	public Map<String, Long> countProcessDefinition(String type) {
		//统计流程定义总数
		long count = repositoryService.createProcessDefinitionQuery()
							.count();
		//没有流程部署
		
		Map<String, Long> map = new HashMap<String, Long>();
		if(count == 0L) {
			map.put("count", 0L);
			map.put("pages", 0L);
			map.put("currentPage", 0L);
			SqfsSessionContext.push("pdInfo", map);
			return map;
		}
		
		//获取session中的流程定义统计信息
		Map<String, Long> info = (Map<String, Long>) SqfsSessionContext.pop("pdInfo");
		long cp = 0L, nextPage = 0L;
		if(info != null) {
			long all = info.get("count");
			cp = info.get("currentPage"); //2
			if(count == all) {
				nextPage = pagination(type, cp);
				info.put("currentPage", nextPage);
				return info;
			}
		}
		
		//默认配置
		//计算总页数,每页最大10条数据
		long maxResults = 5L;
		long pages = 1L;
		if(count > maxResults) {
			if(count % maxResults == 0) {
				pages = count / maxResults;
			} else {
				pages = (count / maxResults) + 1L;
			}			
		}
		//默认配置
		map.put("count", count);
		map.put("pages", pages);
		nextPage = pagination(type, cp);
		map.put("currentPage", nextPage);
		SqfsSessionContext.push("pdInfo", map);
		return map;
	}
	
	/**
	 * 根据用户执行分页操作来计算当前页数
	 * @param type 执行上一页还是下一页
	 * @param currentPage 当前页数
	 * @return 返回出上一页或下一页的页数
	 */
	protected long pagination(String type, long currentPage) {
		long page = 0L;
		switch (type) {
			case "上一页":
				currentPage--;
				page = currentPage;
				break;
				
			case "下一页":
				currentPage++;
				page = currentPage;
				break;
	
			case "默认":
				page = 1L;
				break;
		}
		return page;
	}
		
	//获取部署流程图
	@Override
	public InputStream getProcessDefinitionPng(String deploymentId) {
		//
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
							.deploymentId(deploymentId)
							.singleResult();
		String resourceName = processDefinition.getDiagramResourceName();
		InputStream in = repositoryService.getResourceAsStream(deploymentId, resourceName);
		return in;
	}
	
	//删除流程定义
	@Override
	public void deleteProcessDefinition(String deploymentId) {							
		//删除流程部署
		repositoryService.deleteDeployment(deploymentId, true);		
	}

	//查询未审订单详细信息
	@Override
	public Loan queryOrderDetail(String orderId) {		
		Loan loan=managerMapper.queryOrderDetail(orderId);		
		return loan;
	}
	
	//查询是否有尚未完成的订单
	@Override
	public boolean hasOrder() {
		SqUser user = (SqUser) SqfsSessionContext.pop("info");
		String assignee = user.getT_name();
		List<HistoricTaskInstance> list = historyService.createHistoricTaskInstanceQuery()
						.taskAssignee(assignee)
						.list();
		if(list == null) {
			return false;
		} else {
			for(int i=0; i<list.size(); i++) {
				String processInstanceId = list.get(i).getProcessInstanceId();
				ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
						.processInstanceId(processInstanceId)
						.singleResult();
				if(processInstance == null) {
					continue;
				} else {
					return true;
				}		
			}
			return false;
		}
	}
}
