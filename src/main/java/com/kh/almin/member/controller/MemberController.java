package com.kh.almin.member.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.member.model.service.MemberService;
import com.kh.almin.member.model.vo.Member;

@Controller
@RequestMapping("/members")
public class MemberController {//Service, Dao에서 throws Exception 붙이기
	@Autowired
	private MemberService memberService;
	
//	@Inject //암호화 기능을 사용할수 있게 BCryptPasswordEncoder를 추가
//	BCryptPasswordEncoder pwdEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@GetMapping
	private ModelAndView selectMembers() throws Exception { //@ExceptionHandler가 받는다.
		List<Member> volist = memberService.getMembers();
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberview",volist);
		mv.setViewName("member/memberlist");
		logger.info("전체 회원리스트 조회");
		logger.info("volist: "+volist.toString());
		return mv;
	}
	
	//id, pw 조회 -> 같으면 login 성공 (where절에 id, pw 넣어서)
	@GetMapping("/{userId}")
	private String selectMember(@PathVariable("userId")String userId) throws Exception {
		if(userId == null) {
			logger.info("전체 회원리스트 조회");
		} else {
			logger.info(userId);
		}
		return "member/memberlist";
	}
	
	@PostMapping //회원가입
	private String insertMember(@RequestBody Member member) throws Exception { 
		logger.info("insert 진입");
		logger.info(member.toString());
	/*	int result = memberService.idChk(member);
		try {
			if(result == 1) {
				return "/member/register";
			}else if(result == 0) {
				String inputPass = member.getMemberPw();
				String pwd = pwdEncoder.encode(inputPass);
				member.setMemberPw(pwd);
				
				memberService.register(member);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register
		} catch (Exception  e) {
			throw new RuntimeException();
		}
		return "redirect:/";*/
		
		memberService.insertMember(member);
		return "member/memberJoin";
	}
	
	@PutMapping
	private String updateMember() { //회원정보 수정
		logger.info("update 진입");
		return "member/memberlist";
	}
	@DeleteMapping
	private String deleteMember() { //회원탈퇴
		logger.info("delete 진입");
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
