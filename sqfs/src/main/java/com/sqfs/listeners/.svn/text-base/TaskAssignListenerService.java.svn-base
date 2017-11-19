package com.sqfs.listeners;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqfs.service.ManagerService;

/**
 * 动态指定任务办理人.
 * @author LSZ
 */
@Service("taskAssignListenerService")
public class TaskAssignListenerService implements TaskListener {

	private static final long serialVersionUID = 8354870906646685566L;

	@Autowired
	ManagerService managerService;
	
	@Override
	public void notify(DelegateTask delegateTask) {
		//角色id与办理人要执行的任务id一致(通过角色id与任务id相关联完成动态代理人的任务分配)
		String roleId = delegateTask.getExecution()
						.getCurrentActivityId();
		//获取角色为一审的办理人
		String assignee = managerService.distributeChecker(roleId);
		delegateTask.setAssignee(assignee);
	}

}
