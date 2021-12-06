package com.kh.almin.applicant.model.service;

import java.util.List;

import com.kh.almin.applicant.model.vo.Applicant;
import com.kh.almin.applicant.model.vo.LikeApplicant;
import com.kh.almin.applicant.model.vo.SearchApplicant;

public interface ApplicantService {
	public List<Applicant> getApplicants() throws Exception;

	public List<Applicant> searchApplicant(SearchApplicant searchApplicant) throws Exception;

	public int likeRecruit(LikeApplicant likeApplicant) throws Exception;

	public int dislikeRecruit(LikeApplicant likeApplicant) throws Exception;

	public List<Applicant> listLike(String companyId) throws Exception;

	public int checkLike(LikeApplicant likeApplicant) throws Exception;
}
