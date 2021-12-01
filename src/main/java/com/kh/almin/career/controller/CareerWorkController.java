package com.kh.almin.career.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.almin.career.model.service.CareerNeedService;
import com.kh.almin.career.model.service.CareerWorkService;
import com.kh.almin.career.model.vo.MemberWork;

@Controller
@RequestMapping("/careers")
public class CareerWorkController {
	@Autowired
	private CareerWorkService careerWorkService;
	
	private static final Logger logger = LoggerFactory.getLogger(CareerNeedController.class);
// ===================================================================================================================
	// 근무 일정 전체 조회(select)
	@GetMapping(value = "/works/{userId}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String selectWorkCalList(@PathVariable("userId") String userId) throws Exception {
		System.out.println("@work GetMapping 진입");
		System.out.println("@work PathVariable(\"userId\") : " + userId);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		
		List<Map<String, String>> workList = null;
		
		try {
			workList = careerWorkService.selectWorkCalList(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonStr = gson.toJson(workList);
		System.out.println("jsonStr : " + jsonStr);
		return jsonStr;
	}
// ===================================================================================================================
	// 근무 일정 입력(insert)
	@PostMapping("/works")
	@ResponseBody
	public String insertWork(@RequestBody String insertInfo) {
		System.out.println("@PostMapping(\"/insertneed\") 진입");
		System.out.println("insertInfo : " + insertInfo);
		
		Gson gson = new GsonBuilder().create();
		MemberWork insertMemberWork = gson.fromJson(insertInfo, MemberWork.class);
		System.out.println("insertMemberWork : " + insertMemberWork);
		
		int result = 0;
		try {result = careerWorkService.insertWork(insertMemberWork);} catch (Exception e) {e.printStackTrace();}
		
		String resultStr = "";
		if (result == 1) {resultStr = "ok";} else {resultStr = "false";}
		return resultStr;
	}
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
}
