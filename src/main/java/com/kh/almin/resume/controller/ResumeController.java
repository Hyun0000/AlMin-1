package com.kh.almin.resume.controller;

import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.util.Base64Utils;

import com.kh.almin.member.model.service.MemberService;
import com.kh.almin.member.model.vo.Member;
import com.kh.almin.member.model.vo.SsInfo;
import com.kh.almin.resume.model.service.ResumeService;
import com.kh.almin.resume.model.vo.MemberResume;

@Controller
@RequestMapping("resumes")
@SessionAttributes("msg")
public class ResumeController {
	@Autowired
	private ResumeService resumeService;
	
	@GetMapping("resumeAdd") //이력서 등록 페이지
	public String goResumeAddPage(@RequestParam(value="msg", required=false ) String msg,Model model) throws Exception {
		System.out.println("msg : " + msg);
		model.addAttribute("msg", msg);
		return "resume/resumeAdd";
	}
	@GetMapping("resume") //이력서 상세 조회
	public ModelAndView selectResume(@RequestParam("resumeNo") int resumeNo,ModelAndView mv) {
		MemberResume resum=new MemberResume();
		resum.setResumeNo(resumeNo);
		try {
			mv.addObject("resum", resumeService.selectResume(resumeNo));
			System.out.println("resum: "+resum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("resume/selectResume");
		return mv;
	}
	
	@GetMapping("allres") //로그인된 회원 전체 이력서 조회
	public ModelAndView goAllResumePage(HttpSession session,MemberResume mr,ModelAndView mv) {
//TODO 로그인세션 정보 넘기기
		List<MemberResume> volist=null;
		String userId = ((SsInfo)session.getAttribute("loginInfo")).getMemberId();
		System.out.println("userid : "+userId);
		
		mr.setMemberId(userId);
		try {
			volist = resumeService.selectAllResume(mr);
			System.out.println("이력서 아이디 : "+volist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("allResume", volist);
		System.out.println("allResume : "+volist);
		mv.setViewName("resume/selectAllResume");
		return mv;
	}
	
	@GetMapping("deleteResume")//이력서 삭제
	public String deleteResume(@RequestParam(value="msg", required=false)String msg,int resumeNo,RedirectAttributes rs,Model m) throws Exception{
		
		int result=resumeService.deleteResume(resumeNo);
		if(result==1) {
			rs.addAttribute("msg","삭제되었습니다.");
			m.addAttribute("msg","삭제되었습니다");
		}else {
			rs.addAttribute("msg","다시 시도해주세요.");
			m.addAttribute("msg","다시 시도해주세요.");
		}
		
		return "redirect:allres";
	}
	@GetMapping("update")
	public ModelAndView goUpdateResume(@RequestParam("resumeNo") int resumeNo,ModelAndView mv) {
		try {
			mv.addObject("resum", resumeService.selectResume(resumeNo));
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("resume/updateResume");
		return mv;
	}
	@PostMapping("updateResume")//이력서 수정
	public String updateResume(HttpSession session,@RequestParam(value="msg", required=false)String msg,MemberResume mr,Model m ) throws Exception {
		int result=resumeService.updateResume(mr);
		if(result>0) {
			m.addAttribute("msg","수정되었습니다.");
		}else {
			m.addAttribute("msg","다시 시도해주세요.");
		}
		return "redirect:allres";
	}
	
	@PostMapping("addres")//이력서등록
	public ModelAndView insertResume(HttpSession session,@RequestParam(value = "resumePhoto",required = false) byte[] resumePhoto,MemberResume mr,RedirectAttributes redirectAttributes,HttpServletRequest request,ModelAndView mv) throws Exception{
		System.out.println("mr : "+mr);
		String userId = ((SsInfo)session.getAttribute("loginInfo")).getMemberId();
		Member vo=new Member();
		vo.setMemberId(userId);
		int result=-1;
		byte imageArray[] = null;
		final String BASE_64_PREFIX = "data:image/jpg;base64,";
		try {
			 String base64Url = String.valueOf(resumePhoto);
			
//			 String base64Url = String.valueOf(param.get("image"));
	            if (base64Url.startsWith(BASE_64_PREFIX)){
	                imageArray =  Base64.getDecoder().decode(base64Url.substring(BASE_64_PREFIX.length()));
	                
	                System.out.println("[imageArray] : " + new String(imageArray));
	                
	            }
			result=resumeService.insertResume(mr);
			System.out.println("이력서정보 : "+mr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(result==1) {
			redirectAttributes.addAttribute("msg", "이력서 등록이 되었습니다.");
			mv.addObject("msg", "이력서 등록이 되었습니다.");
			mv.setViewName("redirect:allres");
		}else {
			redirectAttributes.addAttribute("msg", "이력서 등록이 실패하였습니다. 다시 시도해주세요.");
			mv.addObject("msg", "이력서 등록이 실패하였습니다. 다시 시도해주세요.");
			String referer = request.getHeader("Referer"); //이전페이지로 이동
		    mv.setViewName("redirect:"+ referer); 
		}
		return mv;
	}
}