package com.kh.almin.recruit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.recruit.model.service.RecruitServiceImpl;



@Controller
@RequestMapping("/recruits")
public class RecruitJobInfoController {
	@Autowired
	private RecruitServiceImpl recruitservice;
	
	private static final Logger logger = LoggerFactory.getLogger(RecruitJobInfoController.class);
	
	@GetMapping(value="/jobinfoList",produces="text/plain;charset=UTF-8")
	public ModelAndView jobinfoList(ModelAndView mv) throws Exception {
		 mv=new ModelAndView();
		mv.addObject("jobinfolist",recruitservice.recruitList());
		mv.setViewName("recruits/jobinfoList");
		return mv;
	}
	@GetMapping(value="/detailjobinfo",produces="text/plain;charset=UTF-8")
	public ModelAndView detailjobinfo(ModelAndView mv) throws Exception{
		mv=new ModelAndView();
		mv.addObject("detailjobinfo",recruitservice.detailjobinfo());
		mv.setViewName("recruit/detailjobinfo");
		return mv;
	}
}
