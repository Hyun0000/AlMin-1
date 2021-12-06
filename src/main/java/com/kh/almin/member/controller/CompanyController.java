package com.kh.almin.member.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.member.model.service.MemberService;
import com.kh.almin.member.model.vo.Company;

@Controller
@RequestMapping("/companies")//기업회원가입, 아이디찾기, 비밀번호찾기
public class CompanyController { 
	@Autowired
	private MemberService memberService;
	
	@Inject //암호화 기능을 사용할수 있게 BCryptPasswordEncoder를 추가
	BCryptPasswordEncoder pwdEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);

	@GetMapping //기업회원가입창
	private String joinCompany() throws Exception {
		return "member/companyJoin";//TODO: 기업회원가입 화면 만들기
	}
	
	@PostMapping //회원가입
	private String insertCompany(@RequestBody Company company) throws Exception {
		logger.info("insert 진입");
		logger.info(company.toString());
		String inputPass = company.getCompanyPwd();
		String pwd = pwdEncoder.encode(inputPass);
		company.setCompanyPwd(pwd);
		memberService.insertCompany(company);
		return "redirect:";
	}
	
	@ExceptionHandler
	private ModelAndView handleMemberException(Exception e) {
		logger.error(e.getMessage());
		
		//나중에 500error.jsp에서 "errorMessage" 표시해주기 + 뒤로가기, 홈으로 이동 버튼
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorMessage", e.getMessage());
		mv.setViewName("error/500error");
		return mv ;
	}
}
