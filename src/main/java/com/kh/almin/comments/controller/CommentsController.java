package com.kh.almin.comments.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.kh.almin.HomeController;
import com.kh.almin.comments.model.service.CommentsService;
import com.kh.almin.comments.model.vo.CommentsCompany;

@Controller
@RequestMapping("/recruits")
public class CommentsController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommentsController.class);
	
	@Autowired
	private CommentsService commentsService;
// ==============================================================================
	// view용
	// 현재는 (모든 후기 키워드 가져오기 to insert)
	@GetMapping("/detailjobinfo")
	public ModelAndView selectAllCommentAir(ModelAndView mv) {
		Map<String, List<String>> commentsMap = commentsService.selectAllKeyWords();
		mv.addObject("commentsMap", commentsMap);
		mv.setViewName("recruits/detailjobinfo");
		return mv;
	}
// ==============================================================================
	// 후기 작성(ajax)
	// @PostMapping(value = "/commentsinsert")
	@PostMapping(value = "/reviews")
	@ResponseBody
	public String insertUpdate(HttpServletRequest request, HttpServletResponse response, @RequestBody String condition) {
		response.setContentType("application/json;charset=UTF-8");
		
		// Gson을 쓰나 simple-json을 쓰나 해당 부분의 코드는 똑같이 복잡해졌다.
		// 화면에서 넘겨받은 json 형식 data를 Parse할 JSONParser 객체
		 JSONParser jsonParser = new JSONParser();
		
		// Parse한 JSON 객체를 담을 변수
		 JSONObject parsedObj = null;
		
		// 카테고리별 후기를 담은 후 비즈니스 로직으로 넘길 List
		 List<List<String>> commentsList = new ArrayList<List<String>>();
		
		System.out.println("condition : " + condition);
		
		try {
			parsedObj = (JSONObject)jsonParser.parse(condition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("parsedObj : " + parsedObj);
		System.out.println("obj.size() : " + parsedObj.size());
		
		// parsedObj에 있는 각 키워드별 object만 commentsList에 담기
		// parsedObj의 길이(length, size)가 6이므로 restData js object를 제외한 나머지 data를 key 값을 이용해 꺼내기 --> (parsedObj.size() - 1)
		for (int i = 0; i < (parsedObj.size() - 1); i++) {
			// commentsList에 각 카테고리별 data담기, map에서 key을 이용해 접근하는 방식인 get()을 이용해 사용
			commentsList.add((JSONArray)parsedObj.get("keyword_" + i));
		}
		
		// 작성자, 한 줄 후기, 근로계약서 작성 여부 등의 data를 담은 object 꺼내기
		JSONObject parsedObj2 = (JSONObject)parsedObj.get("restData");
		
		// CommentsCompany 생성자에 값 담기
		CommentsCompany commentsCompany = 
		new CommentsCompany(Integer.parseInt((String)parsedObj2.get("ccRecruitNo")), (String)parsedObj2.get("ccWriter"), (String)parsedObj2.get("ccContent"), (String)parsedObj2.get("ccContract"));
		
		System.out.println("================ data 확인용 log ================");
		System.out.println("commentsList : " + commentsList);
		System.out.println("parsedObj.get('restData') : " + parsedObj.get("restData"));
		System.out.println("parsedObj2.get((\"ccRecruitNo\")) : " + parsedObj2.get(("ccRecruitNo")));
		System.out.println("parsedObj2.get((\"ccWriter\")) : " + parsedObj2.get(("ccWriter")));
		System.out.println("parsedObj2.get((\"ccContent\")) : " + parsedObj2.get(("ccContent")));
		System.out.println("parsedObj2.get((\"ccContract\")) : " + parsedObj2.get(("ccContract")));
		System.out.println("commentsCompany.toString() : " + commentsCompany.toString());
		// commentsList에 잘 담겼나 log 찍어보기
		for (int i = 0; i < commentsList.size(); i++) {
			System.out.println(commentsList.get(i));
			for (String list : commentsList.get(i)) {
				System.out.println(list);
			}
		}
		System.out.println("================ data 확인용 log ================");
		
		int result = 0;
		result = commentsService.insertComments(commentsList, commentsCompany);
// ============================================== ajax로 데이터 보내기 ==============================================
		Gson gson = new GsonBuilder().create();
		JsonObject jsonObject = new JsonObject();
		String jsonStr = "";
		
		// (result = 6)가 돼야 후기 insert 성공
		if (result == 6) {
			jsonObject.addProperty("result", "ok");
			jsonStr = gson.toJson(jsonObject);
			System.out.println("jsonStr : " + jsonStr);
			return jsonStr;
		} else {
			// 에러 페이지를 아직 안 만들었기에 임시로 작성
			jsonObject.addProperty("result", "fail");
			jsonStr = gson.toJson(jsonObject);
			return jsonStr;
			
			// TODO
			// 에러페이지로 이동하는 코드 작성
		}
		// https://hianna.tistory.com/629
	}
// ==============================================================================
	// 특정 공고의 전체 후기 조회(ajax)
	@GetMapping(value = "/reviews")
	@ResponseBody
	public String selectAllComments() {
		String jsonStr = "";
		
		
		Map<String, Object> map = commentsService.selectAllComments(1);
		
		return jsonStr;
	}
	
}