package com.kh.almin.myrecruit.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.myrecruit.model.vo.MyRecruit;

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
	// 공고 지원하기 버튼 클릭했을때 --> 개인 회원으로 로그인(받는 값 : 아이디 & 공고번호)
	public int recruitGo(MyRecruit myRecruit) throws Exception {
		return sqlSession.insert("MyRecruit.recruitGo", myRecruit);
	}
// ==============================================================================
// ==============================================================================
// ==============================================================================
	
}
