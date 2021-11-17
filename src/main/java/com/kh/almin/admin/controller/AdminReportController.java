package com.kh.almin.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.member.model.service.MemberServiceImpl;
import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;
import com.kh.almin.recruit.model.service.RecruitServiceImpl;
import com.kh.almin.recruit.model.vo.Recruit;

	@Controller
	@RequestMapping("/report")
	public class AdminReportController {//Service, Dao에서 throws Exception 붙이기
		@Autowired
		private RecruitServiceImpl recruitService;
		
		private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
		
		@GetMapping
		private ModelAndView selectReport() throws Exception { //@ExceptionHandler가 받는다.
			List<Recruit> volist = recruitService.getReport();
			ModelAndView mv = new ModelAndView();
			mv.addObject("reportview",volist);
			mv.setViewName("admin/report");
			logger.info("의심공고리스트 조회");
			logger.info("volist: "+ volist);
			return mv;
		}

}
