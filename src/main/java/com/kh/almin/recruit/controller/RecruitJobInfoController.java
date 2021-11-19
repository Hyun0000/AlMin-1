package com.kh.almin.recruit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.recruit.model.service.RecruitServiceImpl;
import com.kh.almin.recruit.model.vo.Recruit;

@Controller
@RequestMapping("/recruits")
public class RecruitJobInfoController {
	@Autowired
	private RecruitServiceImpl recruitservice;

	private static final Logger logger = LoggerFactory.getLogger(RecruitJobInfoController.class);

	@GetMapping(value = "/jobinfoList", produces = "text/plain;charset=UTF-8")
	public ModelAndView jobinfoList(ModelAndView mv) throws Exception {
		mv = new ModelAndView();
		List<Recruit> volist = recruitservice.recruitList();
		mv.addObject("jobinfolist", volist);
		mv.setViewName("recruits/jobinfoList");

//		페이징 TODO
		logger.info("start jobinfoList" + volist);

		return mv;
	}

	@GetMapping(value = "/detailjobinfo", produces = "text/plain;charset=UTF-8")
	public ModelAndView detailjobinfo(ModelAndView mv) throws Exception {
		mv = new ModelAndView();
		mv.addObject("detailjobinfo", recruitservice.detailjobinfo());
		mv.setViewName("recruit/detailjobinfo");
		return mv;
	}
}