package com.kh.almin.career.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.career.model.vo.MemberNeed;

@Repository("careerDao")
public class CareerDao {
	@Autowired
	private SqlSession sqlSession;
// ===================================================================================================================
	// calender 첫 page --> 지원일자 조회를 calender 첫 페이지로 결정
	public List<Map<String, String>> selectCalList(String userId) {
		List<Map<String, String>> test = null;
		test = sqlSession.selectList("Career.selectNeedCal", userId);
		System.out.println("dao selectCalList : " + test);
		return test;
				
	}
// ===================================================================================================================
	// 구직 & 면접 일정 입력(insert)
	public int insertNeed(MemberNeed memberNeed) throws Exception{
		return sqlSession.insert("Career.insertNeed", memberNeed);
	}
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
}
// ===================================================================================================================
// 회원의 현재 근무지 정보를 가져오는 method
//	public List<Map<String, String>> selectAllWork() {
//		List<Map<String, String>> testData = sqlSession.selectList("Career.selectAllWork");
//		System.out.println("testData : " + testData);
//		return testData;
//	}