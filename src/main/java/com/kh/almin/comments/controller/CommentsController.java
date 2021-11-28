package com.kh.almin.comments.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.weaver.ast.Instanceof;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
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
	/*
	 * @GetMapping("/detailjobinfo") public ModelAndView
	 * selectAllCommentAir(ModelAndView mv) { Map<String, List<String>> commentsMap
	 * = null; try { commentsMap = commentsService.selectAllKeyWords(); } catch
	 * (Exception e) { e.printStackTrace(); } mv.addObject("commentsMap",
	 * commentsMap); mv.setViewName("recruits/detailjobinfo"); return mv; }
	 */
// ==============================================================================
	// 후기 작성(ajax) & update
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
		
		// insert 혹은 update를 결정하는 값을 담는 변수
		String insertOrUpdate = (String)parsedObj2.get("insertOrUpdate");
		System.out.println("insertOrUpdate : " + insertOrUpdate);
		
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
		
		// 비즈니스 로직 GO
		int result = 0;
		try {
			result = commentsService.insertComments(commentsList, commentsCompany, insertOrUpdate);
		} catch (Exception e) {
			e.printStackTrace();
		}
// ========================== ajax로 데이터 보내기 ==========================
		Gson gson = new GsonBuilder().create();
		JsonObject jsonObject = new JsonObject();
		String jsonStr = "";
		
		// (result = 6)가 돼야 후기 insert 성공
		if (result == 6) {
			jsonObject.addProperty("result", "insertOk");
			jsonStr = gson.toJson(jsonObject);
			System.out.println("jsonStr : " + jsonStr);
		} else if(result == 11) {
			jsonObject.addProperty("result", "updateOk");
			jsonStr = gson.toJson(jsonObject);
			System.out.println("jsonStr : " + jsonStr);
		} else {
			// 에러 페이지를 아직 안 만들었기에 임시로 작성
			jsonObject.addProperty("result", "fail");
			jsonStr = gson.toJson(jsonObject);
		}
			return jsonStr;
			
			// TODO
			// 에러페이지로 이동하는 코드 작성
		// https://hianna.tistory.com/629
	}
// ==============================================================================
	// ajax
	// 특정 공고의 전체 후기 조회
	//,@RequestParam(value = "id",  defaultValue = "") String id @RequestParam(value = "recruitNo") 
	@GetMapping(value = "/reviews", produces="text/plain;charset=UTF-8")
	@ResponseBody
	// public String selectAllComments(String recruitNo, String id) {
	// public String selectAllComments(@RequestParam(value = "id",  defaultValue = "") String id, @RequestParam(value = "recruitNo") String recruitNo) {
	public String selectAllComments(String recruitNo, String id) {
			System.out.println("@GetMapping(전체 후기 조회) 진입");
			System.out.println("recruitNo : " + recruitNo);

			// 1. 공고 번호
			int rNo = 0;
			if (recruitNo != null && recruitNo != "") {
				rNo = Integer.parseInt(recruitNo);
			}

			// 2. userID(id가 있냐 없냐에 특정 공고만 가져오는 전체 공고를 가져오는지가 달라진다.)
			String userId = "";
			/*
			 * (id로 넘어오는 값이 없으면 = 전체 후기를 조회하는 것)이면
			 * "" 값인 상태로 userId가 넘어간다.
			 */
			if (id != null && id != "") {
				userId = id;
			}
			
			System.out.println("rNo : " + rNo);
			System.out.println("userId : " + userId);
			
			// DB에서 가져온 data를 담을 Map
			Map<String, Object> map = null;
			
			try {
				 map = commentsService.selectAllComments(rNo, userId);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String jsonStr = "";
			if (map != null) {
				Gson gson = new GsonBuilder().create();
				jsonStr = gson.toJson(map);
				System.out.println("jsonStr : " + jsonStr);
			} else {
				System.out.println("아직 못가지롱");
				// TODO 오류페이지 이동
			}
			
			return jsonStr;
	}
// ==============================================================================
	// ajax
	// 후기 삭제 --> 조건 : 공고번호(CC_RECRUIT_NO) & 작성자 ID
	@DeleteMapping(value = "/reviews")
	@ResponseBody
	public String deleteComment(@RequestBody String test) {
		System.out.println("@DeleteMapping 진입");
		System.out.println("test : " + test);
		
		JsonParser jsonParser = new JsonParser();
		JsonElement jsonElement = jsonParser.parse(test);
		System.out.println("jsonElement : " + jsonElement);
		
		// 작성자 ID
		String id = jsonElement.getAsJsonObject().get("id").getAsString();
		// 공고 번호
		int rNo = jsonElement.getAsJsonObject().get("recruitNo").getAsInt();
		
		System.out.println("id : " + id);
		System.out.println("rNo : " + rNo);
		
		// ajax로 보낼 data
		String result = "";
		
		// 결과
		int deleteResult = 0;
		try {deleteResult = commentsService.deleteComment(rNo, id);}
		catch (Exception e) {e.printStackTrace();}
		
		if (deleteResult == 6) {result = "ok";}
		else {result = "fail";}

		return result;
	}
// ==============================================================================
// ==============================================================================
// ==============================================================================
}




// ajax
// 특정 공고의 전체 후기 조회
//@GetMapping(value = "/reviews", produces="text/plain;charset=UTF-8")
//@ResponseBody
//public String selectAllComments() {
//// public String selectAllComments(@RequestParam(value = "recruitNo") String recruitNo, @RequestParam(value = "id") String id) {
//	System.out.println("@GetMapping(전체 후기 조회) 진입");
//	
//	// System.out.println("recruitNo : " + recruitNo);
//	// System.out.println("id : " + id);
//	
//	String jsonStr = "";
//	// 지금은 data가 없기에 고정값 적용
//	// 임시주석
//	int recruitNo = 1;
//	
//	Map<String, Object> map = null;
//	try {
//		 map = commentsService.selectAllComments(recruitNo);
//	} catch (Exception e) {
//		e.printStackTrace();
//	}
//	
//	if (map != null) {
//		Gson gson = new GsonBuilder().create();
//		jsonStr = gson.toJson(map);
//		System.out.println("jsonStr : " + jsonStr);
//	} else {
//		System.out.println("아직 못가지롱");
//		// TODO 오류페이지 이동
//	}
//	
//	return jsonStr;
//}


