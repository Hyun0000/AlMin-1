package com.kh.almin.myrecruit.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("myRecruitDao")
public class MyRecruitDao {
	@Autowired
	private SqlSession sqlSession;
// ==============================================================================
	// 특정 공고 지원자 전체 조회(조건  : 공고 번호)
	public List<Map<String, Object>> selectRecruitMember(int recruitNo) throws Exception {
		return sqlSession.selectList("MyRecruit.selectRecruitMember", recruitNo);
	}
// ==============================================================================
// ==============================================================================
// ==============================================================================
// ==============================================================================
	
}
