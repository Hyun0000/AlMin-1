package com.kh.almin.resume.model.dao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.resume.model.vo.MemberResume;

@Repository("resumeDao")
public class ResumeDao {
	@Autowired
	private SqlSession sqlSession;
	public int insertResume(MemberResume mr) throws Exception {
		
		return sqlSession.insert("Resume.insertResume", mr);
		
	}
}
