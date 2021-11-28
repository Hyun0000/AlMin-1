package com.kh.almin.resume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.almin.resume.model.service.ResumeService;
import com.kh.almin.resume.model.vo.MemberResume;

@Controller
@RequestMapping("resume")
@SessionAttributes("msg")
public class ResumeController {
	@Autowired
	private ResumeService resumeService;
	
	@GetMapping("resumeAdd") //이력서 등록
	public String goPage(@RequestParam(value="msg", required=false ) String msg) throws Exception {
		return "resume/resumeAdd";
	}
	@PostMapping("addres")
	public String insertResume(MemberResume mr,Model model) throws Exception{

		try {
			if(resumeService.insertResume(mr)==1) {
				model.addAttribute("msg", "이력서 등록이 되었습니다.");
			}else {
				model.addAttribute("msg", "이력서 등록이 실패하였습니다. 다시 시도해주세요.");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "main";
	}
}
