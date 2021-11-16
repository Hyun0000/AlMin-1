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

@Controller
@RequestMapping("/recruits")
public class CommentsController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommentsController.class);
	
	@Autowired
	private CommentsService commentsService;
	
	@GetMapping("/detailjobinfo")
	public ModelAndView selectAllCommentAir(ModelAndView mv) {
		Map<String, List<String>> commentsMap = commentsService.selectAllComments();
//		List<String> air = commentsMap.get("COMMENTS_AIR");
//		List<String> condition = commentsMap.get("COMMENTS_CONDITION");
//		List<String> pay = commentsMap.get("COMMENTS_PAY");
//		List<String> good = commentsMap.get("COMMENTS_GOOD");
//		List<String> bad = commentsMap.get("COMMENTS_BAD");
		
//		mv.addObject("COMMENTS_AIR", air);
//		mv.addObject("COMMENTS_CONDITION", condition);
//		mv.addObject("COMMENTS_PAY", pay);
//		mv.addObject("COMMENTS_GOOD", good);
//		mv.addObject("COMMENTS_BAD", bad);
		mv.addObject("commentsMap", commentsMap);
		mv.setViewName("recruits/detailjobinfo");
		return mv;
	}
// ==============================================================================
	@PostMapping(value = "/commentsinsert")
	@ResponseBody
	public String insertUpdate(HttpServletRequest request, HttpServletResponse response, @RequestBody String condition) {
		response.setContentType("application/json;charset=UTF-8");
		// Gson을 쓰나 simple-json을 쓰나 해당 부분의 코드는 똑같이 복잡해졌다. 그래서 simple을 선택했다.
		// 화면에서 넘겨받은 JSON.stringify(allConditionObj)을 담을 변수
		String fromViewData = "";
		
		// 화면에서 넘겨받은 json 형식 data를 Parse할 JSONParser 객체
		 JSONParser jsonParser = new JSONParser();
		
		// Parse한 JSON 객체를 담을 변수
		 JSONObject parsedObj = null;
		
		// 카테고리별 후기를 담은 후 비즈니스 로직으로 넘길 List
		 List<List<String>> commentsList = new ArrayList<List<String>>();
		
		try {
			System.out.println("condition : " + condition);
			// 한글이 깨진상태로 값이 Controller로 전달되어 이를 막고자 decode 진행			
			// fromViewData = URLDecoder.decode(condition, "UTF-8");
			// JSONParser 객체로 parse후 parsedObj에 담는다.
			 parsedObj = (JSONObject)jsonParser.parse(condition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		   /*
			* fromViewData 예시
			* fromViewData : {
			* "keyword_0":["칼퇴 가능"],
			* "keyword_1":["잡일 많아요"],
			* "keyword_2":["깔끔한 유니폼"],
			* "keyword_3":["사장님 좋아요"],
			* "keyword_4":["만족해요"]
			* }
			*/
			/*
			 * fromViewData : {
			 * "keyword_0":["근무시간 조절 가능","유익한 경험"],
			 * "keyword_1":["지저분한 근무 환경","서있는 시간이 많아요"],
			 * "keyword_2":["청결한 화장실","정해진 일만 해요"],
			 * "keyword_3":["가족 같은 회사에요","상호 배려","재밌어요"],
			 * "keyword_4":["많이줘요","급여일 준수"]
			 * }
			 */
			/*
			 * ["근무시간 조절 가능","유익한 경험"]
			 * ["지저분한 근무 환경","서있는 시간이 많아요"]
			 * ["청결한 화장실","정해진 일만 해요"]
			 * ["가족 같은 회사에요","상호 배려","재밌어요"]
			 * ["많이줘요","급여일 준수"]
			 */
		System.out.println("fromViewData : " + fromViewData);
		System.out.println("obj.size() : " + parsedObj.size());
		
		// parsedObj에 있는 각 
		for (int i = 0; i < parsedObj.size(); i++) {
			// commentsList에 각 카테고리별 data담기, map에서 key을 이용해 접근하는 방식인 get()을 이용해 사용
			commentsList.add((JSONArray)parsedObj.get("keyword_" + i));
		}
		
		System.out.println("=======================================");
		System.out.println(commentsList);
		// [["칼퇴 가능","취업스펙"], ["잡일 많아요","휴식시간 미제공"], ["청결한 화장실","정해진 일만 해요"], ["가족 같은 회사에요","배울점 많아요","상호 배려"], ["많이줘요"]]
		System.out.println("=======================================");
		
		// commentsList에 잘 담겼나 log 찍어보기
		for (int i = 0; i < commentsList.size(); i++) {
			System.out.println(commentsList.get(i));
			for (String list : commentsList.get(i)) {
				System.out.println(list);
			}
		}
		commentsService.insertComments(commentsList);
		
// ============================================== ajax로 데이터 보내기 ==============================================
		Gson gson = new GsonBuilder().create();
		JsonObject jsonObject = new JsonObject();
		String jsonStr = "";
		jsonObject.addProperty("result", "ok");
		jsonStr = gson.toJson(jsonObject);
		System.out.println("jsonStr : " + jsonStr);
		
		return jsonStr;
		// https://hianna.tistory.com/629
	}
}