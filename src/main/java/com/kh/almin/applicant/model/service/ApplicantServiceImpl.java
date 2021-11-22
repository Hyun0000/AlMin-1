package com.kh.almin.applicant.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.admin.model.service.AdminServiceImpl;
import com.kh.almin.applicant.model.dao.ApplicantDao;
import com.kh.almin.applicant.model.vo.Applicant;

@Service
public class ApplicantServiceImpl implements ApplicantService {
	private static final Logger logger = LoggerFactory.getLogger(ApplicantServiceImpl.class);
	@Autowired
	private ApplicantDao applicantDao;

	public List<Applicant> getApplicants() throws Exception {
		logger.info("Service 로깅 확인");
		List<Applicant> applicants = applicantDao.getApplicants();
		return applicants;
	}
	/*
	 * public List<Applicant> searchApplicant(String searchOption, String
	 * searchWord) throws Exception { return
	 * applicantDao.searchApplicant(searchOption, searchWord); }
	 * 
	 */
}
