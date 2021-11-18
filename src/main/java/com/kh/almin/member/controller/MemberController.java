package com.kh.almin.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	
	@Inject //암호화 기능을 사용할수 있게 BCryptPasswordEncoder를 추가
	BCryptPasswordEncoder pwdEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@PostMapping //회원가입
	private String insertMember(@RequestBody Member member) throws Exception { 
		logger.info("insert 진입");
		logger.info(member.toString());
		int result = memberService.idChk(member);
		logger.info(String.valueOf(result));//id값 체크
		try {
			if(result == 1) {
				return "/member/memberJoin";
			}else if(result == 0) {
				String inputPass = member.getMemberPw();
				String pwd = pwdEncoder.encode(inputPass);
				member.setMemberPw(pwd);
				memberService.insertMember(member);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register
		} catch (Exception  e) {
			throw new RuntimeException();
		}
		return "redirect:/";
	}
	@GetMapping
	private ModelAndView selectMembers() throws Exception { //@ExceptionHandler가 받는다.
		List<Member> volist = memberService.getMembers();
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberview",volist);
//		mv.setViewName("member/memberlist");
		mv.setViewName("member/memberJoin");
		logger.info("전체 회원리스트 조회");
		logger.info("volist: "+volist.toString());
		return mv;
	}
	
	//id, pw 조회 -> 같으면 login 성공 (where절에 id, pw 넣어서)
	@PostMapping("/{userId}")
	private String selectMember(HttpSession session,@PathVariable("userId")String userId, @RequestBody Member m) throws Exception {
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
			return "member/memberlist";
		}
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
