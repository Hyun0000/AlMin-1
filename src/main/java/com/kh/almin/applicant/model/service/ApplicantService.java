package com.kh.almin.applicant.model.service;

import java.util.List;

import com.kh.almin.applicant.model.vo.Applicant;
import com.kh.almin.applicant.model.vo.SearchApplicant;

public interface ApplicantService {
	public List<Applicant> getApplicants() throws Exception;

	public List<Applicant> searchApplicant(SearchApplicant searchApplicant) throws Exception;

}
