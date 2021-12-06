package com.kh.almin.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.almin.member.model.service.MailSendService;
import com.kh.almin.member.model.service.MemberService;
import com.kh.almin.member.model.vo.Member;

@Controller
@RequestMapping("/members") // 개인회원가입, 아이디찾기, 비밀번호찾기
public class MemberController {//Service, Dao에서 throws Exception 붙이기
	@Autowired
	private MemberService memberService;
	
	@Inject //암호화 기능을 사용할수 있게 BCryptPasswordEncoder를 추가
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
    private MailSendService mss;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	 @PostMapping("/emails")
	 @ResponseBody
     public String signUp(@RequestBody Member member){
        // DB에 기본정보 insert
		 logger.info(member.getMemberEmail());
        //임의의 authKey 생성 & 이메일 발송
        String authKey = mss.sendAuthMail(member.getMemberEmail());
        member.setAuthKey(authKey);

        Map<String, String> map = new HashMap<String, String>();
        map.put("email", member.getMemberEmail());
        map.put("authKey", member.getAuthKey());
        System.out.println(map);
        return authKey;
      //DB에 authKey 업데이트
    //  memberService.updateAuthKey(map);
  	}
	 @GetMapping("/emails")
	 public ModelAndView mailCheck(@RequestParam String Memberemail, Model model) {
		 logger.info("Memberemail: "+Memberemail);
		 ModelAndView mv = new ModelAndView();
		 mv.addObject("email",Memberemail);
		 mv.setViewName("member/mail");
		 return mv;
		 
	 }
	 
	 
	 
	@PostMapping //회원가입
	private String insertMember(@RequestBody Member member) throws Exception { 
//	private String insertMember(@RequestBody Member member, RedirectAttributes ra) throws Exception { 
		logger.info("insert 진입");
		logger.info(member.toString());

				String inputPass = member.getMemberPw();
				String pwd = pwdEncoder.encode(inputPass);
				member.setMemberPw(pwd);
				memberService.insertMember(member);
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> 가입완료
		//데이터를 싣고 갈 수 있는 방법(1번째 방식) - 실제로 가장 많이 씀
//		ra.addAttribute("k1","aaaa"); //root로 가면서 데이터도 들고 감
		return "redirect:/"; //뒤에 뭐 안적힌걸 보면 root로 가겠다는 뜻
		//forward와 redirect의 차이점
		//forward: url의 변화가 없을 때 
		//redirect: url의 변화가 있을 때 
		
	}
	@PostMapping("/idCheck")//회원가입 - id 중복체크
	@ResponseBody
	private int idCheck(Member member) throws Exception {
		int result = memberService.idChk(member);
		/* 만약, DB에 ID가 존재하면 1을, 존재하지 않으면 0을 return 할 것임 */
		return result;
	}
	
	@GetMapping("/register") //개인, 기업 회원가입 선택 페이지
	private String registMember() throws Exception {
		return "member/register";
	}
	@GetMapping //개인회원가입창
	private String joinMember() throws Exception {
		return "member/memberJoin";
	}
	@GetMapping("/id") //개인 아이디찾기
	private String findIdMember() throws Exception {
		return "member/findId";
	}
	@GetMapping("/pwd") //개인 비밀번호찾기
	private String findPwdMember() throws Exception {
		return "member/findPwd";
	}
//	@GetMapping //회원정보 조회
//	private ModelAndView selectMembers() throws Exception { //@ExceptionHandler가 받는다.
//		List<Member> volist = memberService.getMembers();
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("memberview",volist);
//		mv.setViewName("member/register");//jsp화면
//		
//		//데이터를 싣고 갈 수 있는 방법(2번째 방식)
////		mv.setViewName("redirect:/member/register");//redirect:가 붙으면 jsp가 아니라 RequestMapping 이름
//		
////		logger.info("전체 회원리스트 조회");
////		logger.info("volist: "+volist.toString());
//		return mv;
//	}
	
	@PutMapping
	private String updateMember() { //회원정보 수정
		logger.info("update 진입");
		return "member/memberInfo";
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