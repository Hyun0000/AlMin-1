package com.kh.almin.career.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.weaver.ast.Instanceof;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonParser;
import com.kh.almin.career.model.service.CareerService;
import com.kh.almin.career.model.vo.MemberNeed;


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
//	// 회원의 현재 근무지 정보를 가져오는 method
//	// @PostMapping("/workcalender")
//	
//	@GetMapping(value = "/works", produces="text/plain;charset=UTF-8")
//	@ResponseBody
//	public String selectAllWork() {
//		Gson gson = new GsonBuilder().create();
//		String gsonStr = "";
//		
//		List<Map<String, String>> selectAllWork = careerService.selectAllWork();
//		
//		for (Map<String, String> map : selectAllWork) {
//			System.out.println(map);
//		}
//		
//		gsonStr = gson.toJson(selectAllWork);
//		
//		return gsonStr;
//	}
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
	// 구직 & 면접 일정 입력(insert)
	@PostMapping(value = "/insertCalneed")
	@ResponseBody
	public String insertNeed(@RequestBody String memberNeed) {
		System.out.println("@PostMapping(\"/insertneed\") 진입");
		System.out.println("memberNeed1 : " + memberNeed);
		System.out.println(memberNeed instanceof String);
		
		JSONObject jsonObject = new JSONObject();
		JSONParser jsonParser = new JSONParser();
		try {
			jsonObject = (JSONObject) jsonParser.parse(memberNeed);
			System.out.println("jsonObject : " + jsonObject);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(jsonObject.get("needColor"));
		System.out.println(jsonObject.get("needMemberId"));
		System.out.println(jsonObject.get("needTimeDay"));
		System.out.println(jsonObject.get("needTimeDay"));
		System.out.println(jsonObject.get("needTitle"));
		System.out.println(jsonObject.get("needGoMeet"));
		
		String time = (String)jsonObject.get("needTimeDay");
		time = time.replace("T", " ");
		System.out.println("test : " + time);
		
		MemberNeed MemberNeedVO = 
		new MemberNeed((String)jsonObject.get("needMemberId"), (String)jsonObject.get("needTitle"), (String)jsonObject.get("needColor"), time, (String)jsonObject.get("needGoMeet"));
		
		
		//INSERT INTO MEMBER_NEED VALUES (MEMBER_NEED_SEQUENCE.NEXTVAL, 'user01', '1', 'apple', '2', '명륜갈비', '#003300', TO_DATE('2021-11-02 23:00:00','yyyy-dd-mm hh24:mi:ss'), 'M');

		//SELECT TO_CHAR(NEED_TIME_DAY, 'yyyy-mm-dd hh24:mi:ss') FROM MEMBER_NEED;

		//-- 2021-02-11 23:00:00 --> REPLACE 사용해서 가운데에 T 넣기
		//--start: '2021-11-01T09:00:00'
		//--end : '2021-11-02T23:00:00'
		//--이벤트명 / 날짜+T+시간 / 색깔(기본값 필요) - 무조건 #ff0000 형식으로 입력

	     
		
//		try {
//			System.out.println("memberNeed : " + URLDecoder.decode(memberNeed, "UTF-8"));
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		

		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
