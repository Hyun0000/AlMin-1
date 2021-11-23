package com.kh.almin.admin.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	private ModelAndView selectMembersAll(
			ModelAndView mv
			, @RequestParam(required = false) String searchWord
			, @RequestParam(defaultValue = "id") String searchOption
			, @RequestParam(defaultValue = "#member") String tabName
			) throws Exception { // @ExceptionHandler가 받는다.
		List<Member> mVolist = null;
		List<Company> cVolist = null;
		if(searchWord != null && !searchWord.equals("")) {
			if(tabName.equals("member")) {
				mVolist = adminService.searchMember(searchOption, searchWord);
			}else {
				cVolist = adminService.searchCompany(searchOption, searchWord);
			}
		}
		if(mVolist == null) {
			mVolist = adminService.getMembers();
		} 
		if(cVolist == null) {
			cVolist = adminService.getCompanies();
		}
		mv.addObject("tabName", tabName);
		mv.addObject("memberview", mVolist);
		mv.addObject("companyview", cVolist);
		mv.setViewName("admin/member");
		logger.info("전체 회원리스트 조회");
		logger.info("mvolist: " + mVolist);
		logger.info("cVolist: " + cVolist);
		return mv;
	}

	@PostMapping("/member")
	@ResponseBody
	private List<Member> selectMembers(
			@RequestParam(required = false) String searchWord
			, @RequestParam(defaultValue = "member_id") String searchOption
			) throws Exception { // @ExceptionHandler가 받는다.
		List<Member> mVolist = null;
		if(searchWord != null && !searchWord.equals("")) {
			mVolist = adminService.searchMember(searchOption, searchWord);
		}
		if(mVolist == null) {
			mVolist = adminService.getMembers();
		} 
		logger.info("Member 리스트 조회: "+ searchWord);
		logger.info("mVolist: " + mVolist);
		return mVolist;
	}
	
	@PostMapping("/company")
	@ResponseBody
	private List<Company> selectCompanys(
			@RequestParam(required = false) String searchWord
			, @RequestParam(defaultValue = "company_id") String searchOption
			) throws Exception { // @ExceptionHandler가 받는다.
		List<Company> cVolist = null;
		if(searchWord != null && !searchWord.equals("")) {
			cVolist = adminService.searchCompany(searchOption, searchWord);
		}
		if(cVolist == null) {
			cVolist = adminService.getCompanies();
		}
		
		logger.info("Company 리스트 조회: "+ searchWord);
		logger.info("cVolist: " + cVolist);
		return cVolist;
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
}