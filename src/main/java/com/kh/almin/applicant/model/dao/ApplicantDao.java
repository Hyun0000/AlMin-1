package com.kh.almin.applicant.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.applicant.model.vo.Applicant;

@Repository
public class ApplicantDao {
	private static final Logger logger = LoggerFactory.getLogger(ApplicantDao.class);
	@Autowired
	private SqlSession sqlSession;

	public List<Applicant> getApplicants() throws Exception {
		List<Applicant> applicants = sqlSession.selectList("Applicant.listApplicant");
		System.out.println(applicants);
		logger.info(applicants.toString());
		return applicants;
	}
	/*
	 * public List<Applicant> searchApplicant(String searchOption, String
	 * searchWord) throws Exception { Map<String, String> map = new HashMap<String,
	 * String>(); map.put("searchOption", searchOption); map.put("searchWord",
	 * searchWord); List<Applicant> members =
	 * sqlSession.selectList("Applicant.searchApplicant", map); return members; }
	 * 
	 */
	}
