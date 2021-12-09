package com.kh.almin.resume.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.resume.model.vo.MemberResume;

@Repository("resumeDao")
public class ResumeDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<MemberResume> selectAllResume(MemberResume mr) throws Exception{
		List<MemberResume> resume=sqlSession.selectList("Resume.selectAllResume",mr);
		return resume;
	}
	
	public MemberResume selectResume(int resumeNo) throws Exception{
		MemberResume resum= sqlSession.selectOne("Resume.selectResume",resumeNo);
		return resum;
	}
	
	public int insertResume(MemberResume mr) throws Exception {
		return sqlSession.insert("Resume.insertResume", mr);
		
	}
	
	public int deleteResume(int resumeNo) throws Exception{
		return sqlSession.delete("Resume.deleteResume", resumeNo);
	}
	
	public int updateResume(MemberResume mr) throws Exception{
		return sqlSession.update("Resume.updateResume", mr);
	}
}
