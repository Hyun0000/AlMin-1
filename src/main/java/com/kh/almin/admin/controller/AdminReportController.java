package com.kh.almin.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.admin.model.service.AdminService;
import com.kh.almin.recruit.model.vo.Recruit;

@Controller
@RequestMapping("/report")
public class AdminReportController {// Service, Dao에서 throws Exception 붙이기
	@Autowired
	private AdminService adminService;

	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);

	@GetMapping
	private ModelAndView getReport(ModelAndView mv) throws Exception { // @ExceptionHandler가 받는다.
		List<Recruit> volist = adminService.getReport();
		mv.addObject("reportview", volist);
		mv.setViewName("admin/report");
		logger.info("의심공고리스트 조회");
		logger.info("volist: " + volist);
		return mv;
	}

	@RequestMapping(value = "/dereport", method = RequestMethod.POST)
	@ResponseBody
	private String deleteReport(@RequestParam("rtno") String rtno) throws Exception { // 회원탈퇴
		System.out.println("공고삭제");
		System.out.println(rtno);
		adminService.deleteReport(rtno);
		return "OK";
	}
}
