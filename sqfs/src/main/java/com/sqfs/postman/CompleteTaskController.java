package com.sqfs.postman;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.activiti.engine.TaskService;
import org.apache.naming.factory.SendMailFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sqfs.beans.User;
import com.sqfs.service.ManagerService;

@RestController
@RequestMapping("post")
public class CompleteTaskController {

	@Autowired
	TaskService taskService;
	
	@Autowired
	ManagerService managerService;
	
	@RequestMapping("/c")
	public String complete(HttpServletRequest request) {
		String taskId = request.getParameter("taskId");
		System.out.println("taskId = " + taskId);
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("comment", "驳回");
 		taskService.complete(taskId, variables);
		return "hello";
	}
	
	@RequestMapping("/b")
	public String completec(HttpServletRequest request) {
		String taskId = request.getParameter("taskId");
		System.out.println("taskId = " + taskId);
		Map<String, Object> variables = new HashMap<String, Object>();
 		taskService.complete(taskId);
		return "hello";
	}
	
	@RequestMapping(value="cc", method=RequestMethod.POST)
	public String completeTask(@ModelAttribute User user) {
		System.out.println(user.toString());
		return "ok";
	}
	
	@GetMapping("t")
	public String test() {
		String name = managerService.distributeChecker("一审");
		System.out.println("name = " + name);
		return "ok";
	}
}
