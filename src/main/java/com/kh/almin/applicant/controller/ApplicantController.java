package com.kh.almin.applicant.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.applicant.model.service.ApplicantService;
import com.kh.almin.applicant.model.vo.Applicant;
import com.kh.almin.applicant.model.vo.SearchApplicant;

@Controller
@RequestMapping("/applicants")
public class ApplicantController {
	@Autowired
	private ApplicantService applicantService;

	private static final Logger logger = LoggerFactory.getLogger(ApplicantController.class);

	@GetMapping
	private ModelAndView viewApplicants(SearchApplicant searchApplicant, ModelAndView mv) throws Exception {
		List<Applicant> volist = null;
		List<Applicant> svolist = null;
		String msg = "";
		if (searchApplicant.getMemberGender() != null) {
			svolist = applicantService.searchApplicant(searchApplicant);
			if (svolist == null || svolist.size() == 0) {
				msg = "검색 결과가 없습니다.";
				volist = applicantService.getApplicants();
				mv.addObject("applicants", volist);
			}
			mv.addObject("msg", msg);
			mv.addObject("applicants", svolist);
		} else {
			volist = applicantService.getApplicants();
			mv.addObject("applicants", volist);
		}

		mv.setViewName("applicants/applicants");
		logger.info("이력서 조회");
		logger.info("volist: " + volist);
		logger.info("svolist: " + svolist);
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
