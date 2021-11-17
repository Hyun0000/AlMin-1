package com.kh.almin.recruit.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.recruit.model.vo.Recruit;


@Repository
public class RecruitDao {
	private static final Logger logger = LoggerFactory.getLogger(RecruitDao.class);
	@Autowired
	private SqlSession sqlSession;
	
	public List<Recruit> getReport() throws Exception{
		List<Recruit> recruits = sqlSession.selectList("Recruit.listReport");
		logger.info(recruits.toString());
		System.out.println(recruits);
		return recruits;
	}
	
public List<Recruit> recruitList() throws Exception {
		
		List<Recruit> recruit=sqlSession.selectList("Recruit.jobinfoList");
		return recruit;
	}
}