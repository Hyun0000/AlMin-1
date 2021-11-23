package com.kh.almin.applicant.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.applicant.model.vo.Applicant;
import com.kh.almin.applicant.model.vo.SearchApplicant;

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

	public List<Applicant> searchApplicant(SearchApplicant searchApplicant) throws Exception {
		List<Applicant> members = sqlSession.selectList("Applicant.searchApplicant", searchApplicant);
		return members;
	}

}
