package com.kh.almin.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestMemberController {
	@RequestMapping("testmember")
	public String main() {
		return "member/memberPage";
	}
}
