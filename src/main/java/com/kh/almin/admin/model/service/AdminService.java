package com.kh.almin.admin.model.service;

import java.util.List;

import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;

public interface AdminService {
	public List<Member> getMembers() throws Exception;

	public List<Company> getCompanies() throws Exception;

	public void deleteMember(String memberId) throws Exception;

	public void deleteCompany(String companyId) throws Exception;
}
