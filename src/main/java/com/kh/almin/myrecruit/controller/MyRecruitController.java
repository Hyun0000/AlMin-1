package com.kh.almin.myrecruit.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.comments.controller.CommentsController;
import com.kh.almin.myrecruit.model.service.MyRecruitService;

@Controller
@RequestMapping("/myrecruit")
public class MyRecruitController {
	@Autowired
	private MyRecruitService myRecruitService;
	
	private static final Logger logger = LoggerFactory.getLogger(MyRecruitController.class);
// ==============================================================================
	// 특정 공고 지원자 전체 조회(조건  : 공고 번호)
	@GetMapping("/{recruitNo}")
	public String selectRecruitMember(Model model, @PathVariable(value = "recruitNo") int recruitNo) {
		System.out.println("@GetMapping 진입");
		System.out.println("recruitNo : " + recruitNo);
		List<Map<String, Object>> resultMap = null;
		try {resultMap = myRecruitService.selectRecruitMember(recruitNo);}
		catch (Exception e) {e.printStackTrace();}
		
		System.out.println("resultMap.size() : " + resultMap.size());
		
		if (resultMap.size() != 0) {
			model.addAttribute("resultMap", resultMap);
			model.addAttribute("resultMsg", "yes");
			System.out.println("controller 공고 지원자 있음");
		}
		else if(resultMap.size() == 0)
		{
			model.addAttribute("msg", "공고 지원자가 없습니다.");
			model.addAttribute("resultMsg", "no");
			System.out.println("controller 공고 지원자 없음");
		}
		
		System.out.println("resultMap : " + resultMap);
		return "myrecruit/myrecruit";
	}
// ==============================================================================
// ==============================================================================
// ==============================================================================
// ==============================================================================
// ==============================================================================
}
