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
		int result = -1;
		
		// 1.
		// 현재 유저가 해당 공고를 지원했는지 안했는지 확인
		result = sqlSession.selectOne("MyRecruit.checkRecruit", myRecruit);
		
		if(result == 1) {
			// 지원을 했으면 insert 작업 불가
			result = 0; return result; 
		} else {
			// 2. 지원을 안 했으면 insert 작업 진행
			return sqlSession.insert("MyRecruit.recruitGo", myRecruit);
		}
		
	}
// ==============================================================================
// ==============================================================================
// ==============================================================================
	
}
