package com.kh.almin.member.model.service;

import java.util.List;

import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;

public interface MemberService {

	public List<Member> getMembers() throws Exception;

	public List<Company> getCompanies() throws Exception;

	public void deleteMember(String memberId) throws Exception;

	public void deleteCompany(String companyId) throws Exception;

	public void insertMember(Member member) throws Exception;

}
