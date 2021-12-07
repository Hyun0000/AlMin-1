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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.almin.member.model.service.MemberService;
import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;

@Controller
@RequestMapping("/logins")
@SessionAttributes("loginInfo") //model에다가 attribute를 지정
public class LoginController { //개인/관리자/기업 로그인, SNS로그인
	@Autowired
	private MemberService memberService;
	
	@Inject //암호화 기능을 사용할수 있게 BCryptPasswordEncoder를 추가
	BCryptPasswordEncoder pwdEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	//로그인이 전제되어야 하는 페이지가 필요할때 유용한 @SessionAttributes, @ModelAttribute
//	@ModelAttribute("loginInfo")
//	public Member setMemberSession() throws Exception {
//		Member m = new Member();
//		m.setMemberId("aaa");
//		try {
//			Member ms= memberService.selectMember(m);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return m;
//	}
	
//	@GetMapping //로그인화면
//	private String selectMembers() throws Exception {
//		logger.info("로그인 화면 진입");
//		return "member/loginPopup";//모달창으로 변경(삭제예정)
//	}
	
	//로그인: id, pw 조회 -> 같으면 login 성공 (where절에 id, pw 넣어서)
	@PostMapping("/members/{memberId}")
	@ResponseBody // ajax에 쓰이는 어노테이션. 얘가 없으면 result가 view페이지를 찾음.
	private String loginMember(HttpSession session,@PathVariable("memberId")String memberId, @RequestBody Member m) throws Exception {
//		private String loginMember(HttpSession session, Model model,@PathVariable("memberId")String memberId, @RequestBody Member m) throws Exception {
		String result = "0";
		logger.info("memberId: "+memberId);
		logger.info(m.toString());
		Member ms= memberService.selectMember(m);
		logger.info(ms.toString());
		if(ms.getMemberId() == null) {
			return result;
		}else { // 입력된 비번과 DB에 암호화 저장된 비밀번호 비교 (matches)
			boolean isPwdMatch = pwdEncoder.matches(m.getMemberPw(), ms.getMemberPw());
			logger.info(String.valueOf(isPwdMatch));
			if(isPwdMatch == true) {
				logger.info("로그인 성공");
				result= "1";
				 session.setAttribute("loginInfo", ms);
				 logger.info((String) session.getAttribute("loginInfo"));
				// model.addAttribute("loginInfo",ms); 이런 방식도 있다.
			} else {
				logger.info("로그인 실패");
			}
			return result;
		}
	}
	
	@PostMapping("/companies/{companyId}")
	private String loginCompany(HttpSession session,@PathVariable("companyId")String companyId, @RequestBody Company c) throws Exception {
		String result = "0";
		logger.info("companyId: "+companyId);
		logger.info(c.toString());
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