package com.kh.almin.comments.controller;

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
		mv.addObject("COMMENTS_AIR", commentsService.selectAllCommentAir());
		mv.setViewName("recruits/detailjobinfo");
		
		return mv;
	}
}
