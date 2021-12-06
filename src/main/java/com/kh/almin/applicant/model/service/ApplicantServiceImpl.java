package com.kh.almin.applicant.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.applicant.model.dao.ApplicantDao;
import com.kh.almin.applicant.model.vo.Applicant;
import com.kh.almin.applicant.model.vo.LikeApplicant;
import com.kh.almin.applicant.model.vo.SearchApplicant;

@Service
public class ApplicantServiceImpl implements ApplicantService {
	private static final Logger logger = LoggerFactory.getLogger(ApplicantServiceImpl.class);
	@Autowired
	private ApplicantDao applicantDao;

	public List<Applicant> getApplicants() throws Exception {
		return applicantDao.getApplicants();
	}

	public List<Applicant> searchApplicant(SearchApplicant searchApplicant) throws Exception {
		return applicantDao.searchApplicant(searchApplicant);
	}

	public int likeApplicant(LikeApplicant likeApplicant) throws Exception { 
		return applicantDao.likeApplicant(likeApplicant);
	}

	public int dislikeApplicant(LikeApplicant likeApplicant) throws Exception {
		return applicantDao.dislikeApplicant(likeApplicant);
	}

	public List<Applicant> listLike(String companyId) throws Exception {
		return applicantDao.listLike(companyId);
	}

	public int checkLike(LikeApplicant likeApplicant) throws Exception {
		return applicantDao.checkLike(likeApplicant);

	}
}
