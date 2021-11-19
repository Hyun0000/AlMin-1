package com.kh.almin.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.member.model.service.MemberService;
import com.kh.almin.member.model.vo.Member;

@Controller
@RequestMapping("/logins")
public class LoginController { //개인/관리자/기업 로그인, SNS로그인
	@Autowired
	private MemberService memberService;
	
	@Inject //암호화 기능을 사용할수 있게 BCryptPasswordEncoder를 추가
	BCryptPasswordEncoder pwdEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@GetMapping //로그인화면
	private ModelAndView selectMembers() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/loginPopup");
		return mv;
	}
	
	//로그인: id, pw 조회 -> 같으면 login 성공 (where절에 id, pw 넣어서)
	@PostMapping("/{userId}")
	private String loginMember(HttpSession session,@PathVariable("userId")String userId, @RequestBody Member m) throws Exception {
		logger.info(userId);
		logger.info(m.toString());
		Member ms= memberService.selectMember(m);
		logger.info(ms.toString());
		if(ms == null) {
			return "member/memberJoin";
		}else { // 입력된 비번과 DB에 암호화 저장된 비밀번호 비교 (matches)
			boolean isPwdMatch = pwdEncoder.matches(m.getMemberPw(), ms.getMemberPw());
			logger.info(String.valueOf(isPwdMatch));
			if(isPwdMatch == true) {
				logger.info("로그인 성공");
				 session.setAttribute("loginInfo", ms);
			} else {
				logger.info("로그인 실패");
			}
			return "member/loginPopup";
		}
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
