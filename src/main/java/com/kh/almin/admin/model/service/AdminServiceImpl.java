package com.kh.almin.admin.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.admin.model.dao.AdminDao;
import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;
import com.kh.almin.recruit.model.vo.Recruit;

@Service
public class AdminServiceImpl implements AdminService {
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	@Autowired
	private AdminDao adminDao;

	public List<Member> getMembers() throws Exception {
		logger.info("Service 로깅 확인");
		return adminDao.getMembers();
	}

	public List<Company> getCompanies() throws Exception {
		logger.info("Service 로깅 확인");
		return adminDao.getCompanies();
	}

	public List<Recruit> getReport() throws Exception {
		logger.info("Service 로깅 확인");
		return adminDao.getReport();
	}

	public void deleteMember(String memberId) throws Exception {
		adminDao.deleteMember(memberId);
	}

	public void deleteCompany(String companyId) throws Exception {
		adminDao.deleteCompany(companyId);
	}

	public void deleteReport(String rtno) throws Exception {
		adminDao.deleteReport(rtno);
	}

	public List<Member> searchMember(String searchOption, String searchWord) throws Exception {
		return adminDao.searchMember(searchOption, searchWord);
	}

	public List<Company> searchCompany(String searchOption, String searchWord) throws Exception {
		return adminDao.searchCompany(searchOption, searchWord);
	}

}
