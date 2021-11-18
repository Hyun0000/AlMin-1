package com.kh.almin.admin.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.admin.model.dao.AdminDao;
import com.kh.almin.member.model.dao.MemberDao;
import com.kh.almin.member.model.service.MemberServiceImpl;
import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Autowired
	private AdminDao adminDao;

	public List<Member> getMembers() throws Exception {
		logger.info("Service 로깅 확인");
		List<Member> members = adminDao.getMembers();
		return members;
	}

	public List<Company> getCompanies() throws Exception {
		logger.info("Service 로깅 확인");
		List<Company> companies = adminDao.getCompanies();
		return companies;
	}

	public void deleteMember(String memberId) throws Exception {
		adminDao.deleteMember(memberId);
	}

	public void deleteCompany(String companyId) throws Exception {
		adminDao.deleteCompany(companyId);
	}
}
