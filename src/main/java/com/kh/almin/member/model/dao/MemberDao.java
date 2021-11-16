package com.kh.almin.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;

@Repository
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	@Autowired
	private SqlSession sqlSession;
	
	public List<Member> getMembers() throws Exception{
		List<Member> members = sqlSession.selectList("Member.listMember");
		logger.info(members.toString());
		System.out.println(members);
		return members;
	}
	
	public List<Company> getCompanies() throws Exception{
		List<Company> companies = sqlSession.selectList("Member.listCompany");
		logger.info(companies.toString());
		System.out.println(companies);
		return companies;
	}
	
	public void insertMember(Member member) throws Exception{
		logger.info("insertDao 진입");
		sqlSession.insert("Member.insertMember", member);
	}
	
}
