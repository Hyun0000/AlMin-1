package com.kh.almin.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.member.controller.MemberController;
import com.kh.almin.member.model.vo.Member;

@Repository
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	@Autowired
	private SqlSession sqlSession;
	
	public List<Member> getMembers() throws Exception{
		logger.info("Dao 로깅 확인");
		List<Member> members = new ArrayList();
		members = sqlSession.selectList("Member.listMember");
		return members;
	}
	public void insertMember(Member member) throws Exception{
		logger.info("insertDao 진입");
		sqlSession.insert("Member.insertMember", member);
	}
	
}
