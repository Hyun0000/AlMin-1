package com.kh.almin.resume.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.resume.model.dao.ResumeDao;
import com.kh.almin.resume.model.vo.MemberResume;

@Service
public class ResumeServicelmpl implements ResumeService {
	@Autowired
	private ResumeDao resumeDao;
	public int insertResume(MemberResume mr) throws Exception {
		return resumeDao.insertResume(mr);
	}
}
