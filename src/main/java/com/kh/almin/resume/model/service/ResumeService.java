package com.kh.almin.resume.model.service;

import java.util.List;

import com.kh.almin.resume.model.vo.MemberResume;



public interface ResumeService{
	public int insertResume(MemberResume mr) throws Exception;
	
	public List<MemberResume> selectAllResume(MemberResume mr) throws Exception;
		
	public MemberResume selectResume(int resumeNo) throws Exception;
}
