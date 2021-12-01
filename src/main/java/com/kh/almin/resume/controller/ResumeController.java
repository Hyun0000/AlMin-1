package com.kh.almin.resume.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	@GetMapping("allres") //로그인된 회원 전체 이력서 조회
	public ModelAndView goAllResumePage(MemberResume mr,ModelAndView mv) {
		List<MemberResume> volist=null;
		try {
			volist = resumeService.selectAllResume(mr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("allResume", volist);
		System.out.println("allResume : "+volist);
		mv.setViewName("resume/selectAllResume");
		return mv;
	}
	
	@PostMapping("addres")//이력서등록
	public ModelAndView insertResume(MemberResume mr,RedirectAttributes redirectAttributes,HttpServletRequest request,ModelAndView mv) throws Exception{
		System.out.println("mr : "+mr);
		int result=-1;
		try {
			result=resumeService.insertResume(mr);
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(result==1) {
			redirectAttributes.addAttribute("msg", "이력서 등록이 되었습니다.");
			mv.setViewName("main");
		}else {
			redirectAttributes.addAttribute("msg", "이력서 등록이 실패하였습니다. 다시 시도해주세요.");
			String referer = request.getHeader("Referer"); //이전페이지로 이동
		    mv.setViewName("redirect:"+ referer); 
		}
		return mv;
	}
}
