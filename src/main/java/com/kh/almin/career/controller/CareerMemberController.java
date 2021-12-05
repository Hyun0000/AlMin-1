package com.kh.almin.career.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.almin.career.model.service.CareerMemberService;
import com.kh.almin.career.model.service.CareerNeedService;

@Controller
@RequestMapping("/careers")
public class CareerMemberController {
	@Autowired
	private CareerMemberService careerMemberService;
	
	private static final Logger logger = LoggerFactory.getLogger(CareerMemberController.class);
// ===================================================================================================================
	// 차트에서 개인 경력 조회(조건 : 회원 아이디)
	@GetMapping(value = "/careerchart/{userId}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String chartNeed(@PathVariable("userId") String userId) {
		System.out.println("careerchart 진입");
		System.out.println("careerchart userId : " + userId);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		List<Map<String, String>> careerMapChart = null;
		try {
			careerMapChart = careerMemberService.selectCareerChart(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonStr = "";
		jsonStr = gson.toJson(careerMapChart);
		System.out.println("jsonStr : " + jsonStr);
		
		return jsonStr;
	}
// ===================================================================================================================
// ===================================================================================================================
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
