package com.kh.almin.career.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.career.model.vo.MemberNeed;

@Repository("careerNeedDao")
public class CareerNeedDao {
	@Autowired
	private SqlSession sqlSession;
// ===================================================================================================================
	// calender 첫 page --> 지원일자 조회를 calender 첫 페이지로 결정
	public List<Map<String, String>> selectCalList(String userId) throws Exception {
		List<Map<String, String>> test = null;
		test = sqlSession.selectList("Career.selectCal", userId);
		System.out.println("dao selectCalList : " + test);
		return test;
	}
// ===================================================================================================================
	// 구직 & 면접 일정 입력(insert)
	public int insertNeed(MemberNeed memberNeed) throws Exception{
		return sqlSession.insert("Career.insertCal", memberNeed);
	}
// ===================================================================================================================
	// 일정 삭제(조건 : 제목, 시작시간. 종료시간)
	public int deleteCal(MemberNeed deleteMemberNeed) throws Exception{
		return sqlSession.delete("Career.deleteCal", deleteMemberNeed);
	}
// ===================================================================================================================
	// 일정 수정(조건 : 일정 번호(ID), 유저 아이디, 일정 제목, 일정 색상, 시작일(시간), 종료일(시간), 면접 or 구직 구분값)
	public int updateCal(MemberNeed updateMemberNeed) {
		return sqlSession.update("Career.updateCal", updateMemberNeed);
	}
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