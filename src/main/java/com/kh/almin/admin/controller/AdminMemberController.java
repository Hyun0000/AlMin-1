package com.kh.almin.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;

@Controller
@RequestMapping("/admins")
public class AdminMemberController {// Service, Dao에서 throws Exception 붙이기
	@Autowired
	private AdminService adminService;

	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);

	@GetMapping
	private ModelAndView selectMembers() throws Exception { // @ExceptionHandler가 받는다.
		List<Member> volist = adminService.getMembers();
		List<Company> cvolist = adminService.getCompanies();
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberview", volist);
		mv.addObject("companyview", cvolist);
		mv.setViewName("admin/member");
		logger.info("전체 회원리스트 조회");
		logger.info("volist: " + volist);
		return mv;
	}

	@RequestMapping(value = "/demember", method = RequestMethod.POST)
	@ResponseBody
	private String deleteMember(@RequestParam("memberId") String memberId) throws Exception { // 회원탈퇴
		System.out.println("회원삭제");
		System.out.println(memberId);
		adminService.deleteMember(memberId);
		return "OK";
	}

	@RequestMapping(value = "/decompany", method = RequestMethod.POST)
	@ResponseBody
	private String deleteCompany(@RequestParam("companyId") String companyId) throws Exception { // 회원탈퇴
		System.out.println("기업삭제");
		System.out.println(companyId);
		adminService.deleteCompany(companyId);
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

	@RequestMapping(value = "/searchmem", method = RequestMethod.POST)
	public ModelAndView searchMember(@RequestParam("searchOption") String searchOption, @RequestParam("searchWord") String searchWord) throws Exception {
		
		List<Member> volist = adminService.searchMember(searchOption, searchWord);
		ModelAndView mv = new ModelAndView();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchWord", searchWord);
		mv.addObject("memberview", volist);
		mv.setViewName("admin/member");

		return mv;
	}
	
	@RequestMapping(value = "/searchcom", method = RequestMethod.POST)
	public ModelAndView searchCompany(@RequestParam("searchOption") String searchOption, @RequestParam("searchWord") String searchWord) throws Exception {
		
		List<Company> volist = adminService.searchCompany(searchOption, searchWord);
		ModelAndView mv = new ModelAndView();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchWord", searchWord);
		mv.addObject("companyview", volist);
		mv.setViewName("admin/member");

		return mv;
	}
}
