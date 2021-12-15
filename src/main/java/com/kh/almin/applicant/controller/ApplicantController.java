package com.kh.almin.applicant.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.applicant.model.service.ApplicantService;
import com.kh.almin.applicant.model.vo.Applicant;
import com.kh.almin.applicant.model.vo.LikeApplicant;
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
		SearchApplicant alist = searchApplicant;
		String msg = "";
		if (searchApplicant.getMemberGender() != null) {
			svolist = applicantService.searchApplicant(searchApplicant);
			mv.addObject("alist", alist);
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

	@GetMapping(value = "/myapplicants")
	private ModelAndView listLikes(ModelAndView mv) throws Exception {
		List<Applicant> volist = null;
		volist = applicantService.listLike("testcompany01");
		mv.addObject("applicants", volist);
		mv.setViewName("applicants/myapplicants");
		logger.info("마이페이지-관심공고");
		return mv;
	}

	@GetMapping(value = "/dislike")
	private String dislikeRecruit(LikeApplicant likeApplicant) throws Exception {
		likeApplicant.setCompanyId("testcompany01");
		applicantService.dislikeApplicant(likeApplicant);
		return "redirect:/applicants/myapplicants";
	}

	@PostMapping(value = "/like")
	@ResponseBody
	private String likeRecruit(LikeApplicant likeApplicant) throws Exception {
		String result = "";
		int like = 0;
		likeApplicant.setCompanyId("testcompany01");
		like = applicantService.dislikeApplicant(likeApplicant);
		if (like == 1) {
			System.out.println("찜 해제");
		} else if (like == 0) {
			applicantService.likeApplicant(likeApplicant);
			System.out.println("찜 등록");
		}
		result = String.valueOf(like); // 0: 찜 등록완료, 1. 찜 해제완료
		return result;
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
