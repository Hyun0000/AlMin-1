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
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Autowired
	private MemberDao memberDao;
	
	public List<Member> getMembers() throws Exception{
		logger.info("Service 로깅 확인");
		List<Member> members = memberDao.getMembers();
		return members;
	}
	
	public List<Company> getCompanies() throws Exception{
		logger.info("Service 로깅 확인");
		List<Company> companies = memberDao.getCompanies();
		return companies;
	}
	
	public void deleteMember(String memberId) throws Exception {
		memberDao.deleteMember(memberId);
	}
	
	public void deleteCompany(String companyId) throws Exception {
		memberDao.deleteCompany(companyId);
	}
	
	public void insertMember(Member member) throws Exception{
		logger.info("MemberService-insertMember 진입");
		memberDao.insertMember(member);
	}
}
