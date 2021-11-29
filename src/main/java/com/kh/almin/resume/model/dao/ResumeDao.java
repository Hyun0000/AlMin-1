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
	
	public List<MemberResume> selectResume() throws Exception{
		List<MemberResume> resume=sqlSession.selectOne("Resume.selectResume");
		return resume;
	}
	
	public int insertResume(MemberResume mr) throws Exception {
		return sqlSession.insert("Resume.insertResume", mr);
		
	}
}
