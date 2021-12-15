package com.kh.almin.main.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.applicant.model.service.ApplicantService;
import com.kh.almin.applicant.model.vo.Applicant;
import com.kh.almin.recruit.controller.RecruitController;
import com.kh.almin.recruit.model.service.RecruitService;
import com.kh.almin.recruit.model.vo.CountCat;
import com.kh.almin.recruit.model.vo.Recruit;

@Controller
public class MainPageController {

	@Autowired
	private RecruitService recruitService;
	@Autowired
	private ApplicantService applicantService;

	private static final Logger logger = LoggerFactory.getLogger(RecruitController.class);

	@GetMapping({"main", "/"})
	public ModelAndView main(ModelAndView mv) throws Exception {
		List<Recruit> volist = recruitService.recruitList();
		List<Applicant> avolist = applicantService.getApplicants();
		CountCat countCat = recruitService.countCat();
		mv.addObject("applicants", avolist);
		mv.addObject("recruits", volist);
		mv.addObject("countCat", countCat);
		mv.setViewName("main");

		logger.info("메인페이지");
		return mv;
	}

	@ExceptionHandler
	private ModelAndView handleMemberException(Exception e) {
		logger.error(e.getMessage());
		// 나중에 500error.jsp에서 "errorMessage" 표시해주기 + 뒤로가기, 홈으로 이동 버튼
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorMessage", e.getMessage());
		mv.setViewName("error/500error");
		return mv;
	}
}
