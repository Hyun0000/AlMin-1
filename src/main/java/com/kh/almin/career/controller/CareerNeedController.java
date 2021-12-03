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
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.almin.career.model.service.CareerNeedService;
import com.kh.almin.career.model.vo.MemberNeed;


@Controller
@RequestMapping("/careers")
public class CareerNeedController {
	@Autowired
	private CareerNeedService careerNeedService;
	
	private static final Logger logger = LoggerFactory.getLogger(CareerNeedController.class);
// ===================================================================================================================
	// calender 첫 page를 열어주는 view용 method
	@GetMapping("/calender")
	public String loadCalender() throws Exception {
		System.out.println("view용 메소드 진입");
		return "careers/careers";
	}
// ===================================================================================================================
	// calender 첫 page --> 지원 & 면접 일자 조회를 calender 첫 페이지로 결정
	@GetMapping(value = "/calender/{userId}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String selectCalList(@PathVariable("userId") String userId) throws Exception {
		System.out.println("need @GetMapping 진입");
		System.out.println("need @PathVariable(\"userId\") : " + userId);
		
		Gson gson = new GsonBuilder().create();
		
		List<Map<String, String>> calList = null;
		try {
			calList = careerNeedService.selectCalList(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonStr = gson.toJson(calList);
		System.out.println("jsonStr : " + jsonStr);
		return jsonStr;
	}
// ===================================================================================================================
	// 구직 & 면접 일정 입력(insert)
	// @PostMapping(value = "/insertCalneed")
	@PostMapping(value = "/calender")
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
		} catch (ParseException e) {e.printStackTrace();}
		
		String startTime = (String)jsonObject.get("needTimeStart");
		String endTime = (String)jsonObject.get("needTimeEnd");
		
		MemberNeed memberNeedVO = 
		new MemberNeed((String)jsonObject.get("needMemberId"), (String)jsonObject.get("needTitle"), (String)jsonObject.get("needColor"), startTime, endTime, (String)jsonObject.get("needGoMeet"));
		
		int result = 0;
		try {
			result = careerNeedService.insertNeed(memberNeedVO);
		} catch (Exception e) {e.printStackTrace();}
		String resultStr = "";
		if (result == 1) {System.out.println("일정추가 성공"); resultStr = "ok";}
		else if(result == 0) {System.out.println("일정추가 실패"); resultStr = "false";}
		return resultStr;
	}
// ===================================================================================================================
	// 구직 & 면접 일정 삭제(조건 : 유저 아이디, 일정 번호)
	@DeleteMapping(value = "/calender")
	@ResponseBody
	public String deleteCal(@RequestBody String deleteInfo) {
		System.out.println("@DeleteMapping 진입");
		System.out.println("deleteInfo : " + deleteInfo);
		
		Gson gson = new GsonBuilder().create();
		MemberNeed deleteMemberNeed = gson.fromJson(deleteInfo, MemberNeed.class);
		System.out.println("deleteMemberNeed : " + deleteMemberNeed);
		System.out.println("memberNeed.getNeedTitle() : " + deleteMemberNeed.getNeedTitle());
		System.out.println("memberNeed.getNeedTimeStart() : " + deleteMemberNeed.getNeedTimeStart());
		System.out.println("memberNeed.getNeedTimeEnd() : " + deleteMemberNeed.getNeedTimeEnd());
		
//		JsonElement jsonElement = new JsonParser().parse(deleteInfo);
//		JsonParser jsonParser = new JsonParser();
//		JsonObject jsonObject = (JsonObject)jsonParser.parse(deleteInfo);
//		System.out.println("jsonObject : " + jsonObject);
//		System.out.println(jsonObject.getAsString().get);
		
		int result = 0;
		try {result = careerNeedService.deleteCal(deleteMemberNeed);} catch (Exception e) {e.printStackTrace();}
		
		String resultStr = "";
		if (result == 1) {resultStr = "ok";} else {resultStr = "false";}
		return resultStr;
	}
// ===================================================================================================================
	// 구직 & 면접 일정 수정(조건 : 일정 번호(ID), 유저 아이디, 일정 제목, 일정 색상, 시작일(시간), 종료일(시간), 면접 or 구직 구분값)
	@PatchMapping(value = "/calender")
	@ResponseBody
	public String updateCal(@RequestBody String updateInfo) {
		System.out.println("@PatchMapping 진입");
		System.out.println("updateInfo : " + updateInfo);
		
		Gson gson = new GsonBuilder().create();
		MemberNeed updateMemberNeed = gson.fromJson(updateInfo, MemberNeed.class);
		System.out.println("updateMemberNeed : " + updateMemberNeed);
		
		int result = 0;
		try {
			result = careerNeedService.updateCal(updateMemberNeed);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String resultStr = "";
		if (result == 1) {resultStr = "ok";}
		else {resultStr = "false";}
		return resultStr;
	}
// ===================================================================================================================
	// 차트에서 구직 & 면접 횟수 조회(년&월 기준)
	@GetMapping(value = "/needchart/{userId}", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String chartNeed(@PathVariable("userId") String userId, @RequestParam(name = "year") String year, @RequestParam(name = "month") String month) {
		System.out.println("chartNeed 진입");
		System.out.println("userId : " + userId + ", year : " + year + ", month : " + month);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		List<Map<String, String>> needMapChart = null;
		try {
			needMapChart = careerNeedService.chartNeed(userId, year, month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonStr = "";
		jsonStr = gson.toJson(needMapChart);
		System.out.println("jsonStr : " + jsonStr);
		
		return jsonStr;
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