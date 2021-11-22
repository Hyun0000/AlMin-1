package com.kh.almin.member.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.member.model.dao.MemberDao;
import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;

@Service
public class MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	@Autowired
	private MemberDao memberDao;
	
	public List<Member> getMembers() throws Exception{
		logger.info("Service 진입");
		List<Member> members = memberDao.getMembers();
		return members;
	}
	
	public void insertMember(Member member) throws Exception{
		logger.info("MemberService-insertMember 진입");
		memberDao.insertMember(member);
	}
	public int idChk(Member member) throws Exception{
		logger.info("아이디체크 진입");
		Integer result = memberDao.idChk(member);
		return result;
	}
	public Member selectMember(Member member) throws Exception{
		logger.info("아디비번 동시체크 진입");
		Member result = memberDao.selectMember(member);
		return result;
	}
}
