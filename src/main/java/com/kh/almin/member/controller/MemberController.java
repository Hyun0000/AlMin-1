package com.kh.almin.member.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.member.model.service.MemberService;
import com.kh.almin.member.model.vo.Member;

@Controller
@RequestMapping("/members")
public class MemberController {//Service, Dao에서 throws Exception 붙이기
	@Autowired
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@GetMapping
	private ModelAndView selectMembers() throws Exception { //@ExceptionHandler가 받는다.
	List<Member> volist = new ArrayList<Member>();
	ModelAndView mv = new ModelAndView();
	volist= memberService.getMembers();
	mv.addObject("memberview",volist);
	mv.setViewName("member/memberlist");
	
		logger.info("전체 회원리스트 조회");
		
		return mv;
	}
	
	@GetMapping("/{userId}")
	private String selectMember(@PathVariable("userId")String userId) {
		if(userId == null) {
			logger.info("전체 회원리스트 조회");
		} else {
			logger.info(userId);
		}
		return "member/memberlist";
	}
	
	@PostMapping("/")
	private String insertMember() {
		return "member/memberlist";
	}
	
	@PutMapping("/")
	private String updateMember() {
		return "member/memberlist";
	}
	@DeleteMapping("/")
	private String deleteMember() {
		return "member/memberlist";
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
