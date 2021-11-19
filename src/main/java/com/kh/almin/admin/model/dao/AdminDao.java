package com.kh.almin.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;
import com.kh.almin.recruit.model.vo.Recruit;

@Repository
public class AdminDao {

	private static final Logger logger = LoggerFactory.getLogger(AdminDao.class);
	@Autowired
	private SqlSession sqlSession;

	public List<Member> getMembers() throws Exception {
		List<Member> members = sqlSession.selectList("AdminMember.listMember");
		logger.info(members.toString());
		System.out.println(members);
		return members;
	}

	public List<Company> getCompanies() throws Exception {
		List<Company> companies = sqlSession.selectList("AdminMember.listCompany");
		logger.info(companies.toString());
		System.out.println(companies);
		return companies;
	}

	public List<Recruit> getReport() throws Exception {
		List<Recruit> recruits = sqlSession.selectList("AdminRecruit.listReport");
		logger.info(recruits.toString());
		System.out.println(recruits);
		return recruits;
	}

	public void deleteMember(String memberId) throws Exception {
		sqlSession.delete("AdminMember.deleteMember", memberId);
	}

	public void deleteCompany(String companyId) throws Exception {
		sqlSession.delete("AdminMember.deleteCompany", companyId);
	}

	public void deleteReport(String rtno) throws Exception {
		sqlSession.delete("AdminRecruit.deleteReport", rtno);
	}

	public List<Member> searchMember(String searchOption, String searchWord) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("searchWord", searchWord);
		List<Member> members = sqlSession.selectList("AdminMember.searchMember", map);
		return members;
	}

	public List<Company> searchCompany(String searchOption, String searchWord) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("searchWord", searchWord);
		List<Company> companies = sqlSession.selectList("AdminMember.searchCompany", map);
		return companies;
	}

}
