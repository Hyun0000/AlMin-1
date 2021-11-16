package com.kh.almin.career.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.almin.career.model.service.CareerService;


@Controller
@RequestMapping("/careers")
public class CareerController {
	@Autowired
	private CareerService careerService;
	
	private static final Logger logger = LoggerFactory.getLogger(CareerController.class);
// ===================================================================================================================
	// calender 첫 page를 열어주는 view용 method
	@GetMapping("/calender")
	public String selectCareers() throws Exception {
		return "careers/careers";
	}
// ===================================================================================================================
	// 회원의 현재 근무지 정보를 가져오는 method
	// @PostMapping("/workcalender")
	
	@GetMapping(value = "/workcalender", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String selectAllWork() {
		Gson gson = new GsonBuilder().create();
		String gsonStr = "";
		
		List<Map<String, String>> selectAllWork = careerService.selectAllWork();
		
		for (Map<String, String> map : selectAllWork) {
			System.out.println(map);
		}
		
		gsonStr = gson.toJson(selectAllWork);
		
		return gsonStr;
	}
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// ===================================================================================================================
	// 예외처리
	@ExceptionHandler
	private ModelAndView handleMemberException(Exception e) {
		logger.error(e.getMessage());
		
		//나중에 500error.jsp에서 "errorMessage" 표시해주기 + 뒤로가기, 홈으로 이동 버튼
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorMessage", e.getMessage());
		mv.setViewName("error/500error");
		return mv ;
	}
}
