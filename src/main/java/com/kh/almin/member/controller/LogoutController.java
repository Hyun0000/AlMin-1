package com.kh.almin.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.member.model.vo.Member;

@Controller
@RequestMapping("/logout")
public class LogoutController {

	private static final Logger logger = LoggerFactory.getLogger(LogoutController.class);
	@GetMapping//로그아웃
    public String logoutMember(@ModelAttribute("loginInfo") Member member,
            HttpServletRequest request,
            Model model) throws Exception{
		//invalidate: 모든 세션 무효화 / removeAttribute: 특정 세션만 종료
           request.getSession().removeAttribute("loginInfo");
           request.getSession().removeAttribute("state");//네이버 로그아웃
            //sns로그아웃 -> 토큰값 지우기 -> 네이버 쪽에 api 날리기
            //DB에 있는 것도 지우고, 세션도 지우고
            logger.info("로그아웃");
            return "member/logoutAction";
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
