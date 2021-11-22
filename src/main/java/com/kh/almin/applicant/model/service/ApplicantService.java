package com.kh.almin.applicant.model.service;

import java.util.List;

import com.kh.almin.applicant.model.vo.Applicant;

public interface ApplicantService {
	public List<Applicant> getApplicants() throws Exception;

//	public List<Applicant> searchApplicant(String searchOption, String searchWord) throws Exception;

}
