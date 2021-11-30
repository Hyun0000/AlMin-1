package com.kh.almin.career.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.almin.career.model.service.CareerNeedService;

@Controller
@RequestMapping("/careers")
public class CareerWorkController {
	// /careers/works
	@Autowired
	private CareerNeedService careerNeedService;
	
	@GetMapping(value = "/works/{userId}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String selectWorkCalList(@PathVariable("userId") String userId) throws Exception {
		System.out.println("@work GetMapping 진입");
		System.out.println("@work PathVariable(\"userId\") : " + userId);
		
		String jsonStr = "";
		System.out.println("jsonStr : " + jsonStr);
		return jsonStr;
	}
}
