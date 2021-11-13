package com.kh.almin.comments.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
import com.kh.almin.comments.model.service.CommentsService;

@Controller
@RequestMapping("/recruits")
public class CommentsController {
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
		
		JSONParser jsonParser = new JSONParser();
		JSONObject obj = null;
		String apple = "";
		
		try {
			System.out.println("condition : " + URLDecoder.decode(condition, "UTF-8"));
			apple = URLDecoder.decode(condition, "UTF-8");
			System.out.println("apple : " + apple);
			
			obj = (JSONObject)jsonParser.parse(apple);
			JSONArray goodArray = (JSONArray) obj.get("keyword_0");
			System.out.println("goodArray : " + goodArray);
			
			for (int i = 0; i < goodArray.size(); i++) {
				System.out.println("goodArray.get(" + i + ") : " + goodArray.get(i));
			}

			
			
			
			
			
			System.out.println("obj : " + obj);
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
//		System.out.println("good : " + good);
//		System.out.println("bad : " + bad);
//		System.out.println("condition : " + condition);
//		System.out.println("air : " + air);
//		System.out.println("pay : " + pay);
		
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
//, @RequestParam(name = "good") String good
//, @RequestParam(name = "bad") String bad
//, @RequestParam(name = "condition") String condition
//, @RequestParam(name = "air") String air
//, @RequestParam(name = "pay") String pay