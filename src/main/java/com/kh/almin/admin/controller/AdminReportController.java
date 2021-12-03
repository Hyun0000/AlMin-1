package com.kh.almin.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.admin.model.service.AdminService;
import com.kh.almin.recruit.model.service.RecruitService;
import com.kh.almin.recruit.model.vo.Recruit;

@Controller
@RequestMapping("/report")
public class AdminReportController {// Service, Dao에서 throws Exception 붙이기
	@Autowired
	private AdminService adminService;
	@Autowired
	private RecruitService recruitService;

	private static final Logger logger = LoggerFactory.getLogger(AdminReportController.class);

	@GetMapping
	private ModelAndView getReport(ModelAndView mv) throws Exception {
		List<Recruit> volist = adminService.getReport();
		mv.addObject("reportview", volist);
		mv.setViewName("admin/report");
		logger.info("의심공고리스트 조회");
		return mv;
	}

	@RequestMapping(value = "/listreason", method = RequestMethod.POST)
	@ResponseBody
	private List<String> listReason(@RequestParam("recruitNo") int recruitNo) throws Exception {
		List<String> result = recruitService.listReason(recruitNo);
		return result;
	}

	@RequestMapping(value = "/dereport", method = RequestMethod.POST)
	@ResponseBody
	private String deleteReport(@RequestParam(value = "rtno", required = false) String rtno) throws Exception { // 회원탈퇴
		System.out.println("공고삭제");
		System.out.println(rtno);
		adminService.deleteReport(rtno);
		return "OK";
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
