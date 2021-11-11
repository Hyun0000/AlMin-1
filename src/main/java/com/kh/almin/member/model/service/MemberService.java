package com.kh.almin.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.member.model.dao.MemberDao;
import com.kh.almin.member.model.vo.Member;

@Service
public class MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	@Autowired
	private MemberDao memberDao;
	
	public List<Member> getMembers() throws Exception{
		logger.info("Service 로깅 확인");
		List<Member> members = new ArrayList();
		members = memberDao.getMembers();
		return members;
	}
}
