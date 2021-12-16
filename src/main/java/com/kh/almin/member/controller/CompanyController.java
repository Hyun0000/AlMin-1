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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.member.model.service.MemberService;
import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;

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
	
	@PostMapping("/idCheck")//회원가입 - id 중복체크
	@ResponseBody
	private int idCheck(Company c) throws Exception {
		int result = memberService.idChkCompany(c);
		/* 만약, DB에 ID가 존재하면 1을, 존재하지 않으면 0을 return 할 것임 */
		return result;
	}
	
	@PostMapping("/id/tel") //기업 아이디찾기(연락처)
	private String findCIdphone(@RequestBody Company c) throws Exception {
		String result="";
		logger.info(c.toString());
		Company ms= memberService.findCIdphone(c);
		if(ms.getCompanyId() == null) {
			return result;
		}else {
			logger.info("아이디찾기 성공");
			result=ms.getCompanyId();
		}
		return result;
	}
	@PostMapping("/id/mail") //기업 아이디찾기(이메일)
	private String findCIdmail(@RequestBody Company c) throws Exception {
		String result="";
		logger.info(c.toString());
		Company ms= memberService.findCIdmail(c);
		if(ms.getCompanyId() == null) {
			return result;
		}else {
			logger.info("아이디찾기 성공");
			result=ms.getCompanyId();
		}
		return result;
	}
	
	@PostMapping("/id/num") //기업 아이디찾기(사업자번호)
	private String findCIdnum(@RequestBody Company c) throws Exception {
		String result="";
		logger.info(c.toString());
		Company ms= memberService.findCIdnum(c);
		if(ms.getCompanyId() == null) {
			return result;
		}else {
			logger.info("아이디찾기 성공");
			result=ms.getCompanyId();
		}
		return result;
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
