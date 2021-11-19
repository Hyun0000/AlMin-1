package com.kh.almin.admin.model.service;

import java.util.List;

import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;
import com.kh.almin.recruit.model.vo.Recruit;

public interface AdminService {
	public List<Member> getMembers() throws Exception;

	public List<Company> getCompanies() throws Exception;

	public void deleteMember(String memberId) throws Exception;

	public void deleteCompany(String companyId) throws Exception;

	public void deleteReport(String rtno) throws Exception;
	
	public List<Recruit> getReport() throws Exception;

	public List<Member> searchMember(String searchOption, String searchWord) throws Exception;

	public List<Company> searchCompany(String searchOption, String searchWord) throws Exception;

}
