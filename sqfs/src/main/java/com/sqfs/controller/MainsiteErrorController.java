package com.sqfs.controller;

import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Scope("prototype")
public class MainsiteErrorController implements ErrorController{
	
	private static final String  ERROR_PATH="/error";
	
	@RequestMapping("/error")
	public  String handleError(){
		return  "404";
	}
	@Override
	public String getErrorPath() {
		// TODO Auto-generated method stub
		return ERROR_PATH;
	}

}
