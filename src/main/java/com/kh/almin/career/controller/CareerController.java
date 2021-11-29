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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
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
	public String loadCalender() throws Exception {
		System.out.println("view용 메소드 진입");
		return "careers/careers";
	}
// ===================================================================================================================
	// calender 첫 page --> 지원일자 조회를 calender 첫 페이지로 결정
	@GetMapping(value = "/calender/{userId}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String selectCalList(@PathVariable("userId") String userId) throws Exception {
		System.out.println("@GetMapping 진입");
		System.out.println("@PathVariable(\"userId\") : " + userId);
		
		Gson gson = new GsonBuilder().create();
		
		List<Map<String, String>> calList = null;
		try {
			calList = careerService.selectCalList(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonStr = gson.toJson(calList);
		System.out.println("jsonStr : " + jsonStr);
		return jsonStr;
	}
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
			e.printStackTrace();
		}
		
		String startTime = (String)jsonObject.get("needTimeStart");
		startTime = startTime.replace("T", " ");
		System.out.println("startTime : " + startTime);
		
		String endTime = (String)jsonObject.get("needTimeEnd");
		endTime = endTime.replace("T", " ");
		System.out.println("endTime : " + endTime);
		
		MemberNeed memberNeedVO = 
		new MemberNeed((String)jsonObject.get("needMemberId"), (String)jsonObject.get("needTitle"), (String)jsonObject.get("needColor"), startTime, endTime, (String)jsonObject.get("needGoMeet"));
		
		int result = 0;
		try {
			result = careerService.insertNeed(memberNeedVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result == 1) {
			System.out.println("일정추가 성공");
		} else if(result == 0) {
			System.out.println("일정추가 실패");
		}
		System.out.println();
		

		// 2021-02-11 23:00:00 --> REPLACE 사용해서 가운데에 T 넣기
		// title : 명륜진사갈비
		// start: '2021-11-01T09:00:00'
		// end : '2021-11-02T23:00:00'
		// color : red

		return "ok";
	}
// ===================================================================================================================
	// 일정 삭제(조건 : 제목, 시작시간. 종료시간)
	@DeleteMapping(value = "/calender")
	@ResponseBody
	public String deleteCal(@RequestBody String deleteInfo) {
		System.out.println("@DeleteMapping 진입");
		System.out.println("deleteInfo : " + deleteInfo);
		
		Gson gson = new GsonBuilder().create();
		MemberNeed memberNeed = gson.fromJson(deleteInfo, MemberNeed.class);
		System.out.println("memberNeed : " + memberNeed);
		System.out.println("memberNeed.getNeedTitle() : " + memberNeed.getNeedTitle());
		System.out.println("memberNeed.getNeedTimeStart() : " + memberNeed.getNeedTimeStart());
		System.out.println("memberNeed.getNeedTimeEnd() : " + memberNeed.getNeedTimeEnd());
		
//		JsonElement jsonElement = new JsonParser().parse(deleteInfo);
//		JsonParser jsonParser = new JsonParser();
//		JsonObject jsonObject = (JsonObject)jsonParser.parse(deleteInfo);
//		System.out.println("jsonObject : " + jsonObject);
//		System.out.println(jsonObject.getAsString().get);
		
		int result = 0;
		try {result = careerService.deleteCal(memberNeed);}
		catch (Exception e) {e.printStackTrace();}
		
		String resultStr = "";
		if (result == 1) {resultStr = "ok";}
		else {resultStr = "false";}
		return resultStr;
	}
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
//===================================================================================================================
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