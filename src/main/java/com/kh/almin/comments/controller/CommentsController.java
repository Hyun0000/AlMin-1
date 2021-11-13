package com.kh.almin.comments.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
}
