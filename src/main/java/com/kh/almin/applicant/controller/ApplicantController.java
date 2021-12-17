package com.kh.almin.applicant.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.kh.almin.member.model.vo.SsInfo;

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
	private ModelAndView listLikes(ModelAndView mv, HttpSession session) throws Exception {
		List<Applicant> volist = null;
		SsInfo loginInfo = (SsInfo) session.getAttribute("loginInfo");
		String id = loginInfo.getCompanyId();
		volist = applicantService.listLike(id);
		mv.addObject("applicants", volist);
		mv.setViewName("applicants/myapplicants");
		logger.info("마이페이지-관심공고");
		return mv;
	}

	@GetMapping(value = "/dislike")
	private String dislikeRecruit(LikeApplicant likeApplicant, HttpSession session) throws Exception {
		SsInfo loginInfo = (SsInfo) session.getAttribute("loginInfo");
		String id = loginInfo.getCompanyId();
		likeApplicant.setCompanyId(id);
		applicantService.dislikeApplicant(likeApplicant);
		return "redirect:/applicants/myapplicants";
	}

	@PostMapping(value = "/isliked")
	@ResponseBody
	private String isLiked(LikeApplicant likeApplicant, HttpSession session) throws Exception {
		String result = "";
		int like = 0;
		SsInfo loginInfo = (SsInfo)session.getAttribute("loginInfo");
		String id = loginInfo.getCompanyId();
		likeApplicant.setCompanyId(id);
		like = applicantService.checkLike(likeApplicant);
		if (like == 1) {
			System.out.println("찜 있음");
		} else if (like == 0) {
			System.out.println("찜 없음");
		}
		result = String.valueOf(like); // 0: 찜 등록완료, 1. 찜 해제완료
		return result;
	}
	
	@PostMapping(value = "/like")
	@ResponseBody
	private String likeRecruit(LikeApplicant likeApplicant, HttpSession session) throws Exception {
		String result = "";
		int like = 0;
		SsInfo loginInfo = (SsInfo)session.getAttribute("loginInfo");
		String id = loginInfo.getCompanyId();
		likeApplicant.setCompanyId(id);
		like = applicantService.dislikeApplicant(likeApplicant);
		System.out.println("like전!!!!!!!!!! : " + like);
		if (like == 1) {
			System.out.println("찜 해제");
		} else if (like == 0) {
			applicantService.likeApplicant(likeApplicant);
			System.out.println("찜 등록");
		}
		result = String.valueOf(like); // 0: 찜 등록완료, 1. 찜 해제완료
		System.out.println("like후!!!!!!!!!! : " + like);
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
