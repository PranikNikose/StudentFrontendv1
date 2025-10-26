package com.example.frontend.controller;

import com.opensymphony.xwork2.ActionSupport;

public class HomeAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		//System.out.println("HomeAction executed");
		return "success";
	}
}