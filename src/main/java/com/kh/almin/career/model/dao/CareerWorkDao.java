package com.kh.almin.career.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.career.model.vo.MemberWork;

@Repository("careerWorkDao")
public class CareerWorkDao {
	@Autowired
	private SqlSession sqlSession;
// ===================================================================================================================
	// 근무 일정 전체 조회(select)
	public List<Map<String, String>> selectWorkCalList(String userId) {
		List<Map<String, String>> test = null;
		test = sqlSession.selectList("CareerWork.selectWorkCal", userId);
		System.out.println("dao workList : " + test);
		return test;
	}
// ===================================================================================================================
	// 근무 일정 입력(insert)
	public int insertWork(MemberWork insertMemberWork) {
		return sqlSession.insert("CareerWork.insertWorkCal", insertMemberWork);
	}
// ===================================================================================================================
	// 근무 일정 삭제(조건 : 유저 아이디, 일정 번호)
	public int deleteWork(MemberWork deleteMemberWork) {
		return sqlSession.insert("CareerWork.deleteWorkCal", deleteMemberWork);
	}
// ===================================================================================================================
	// 근무 일정 수정(받는 값 : 일정 번호(ID), 유저 아이디, 일정 제목, 일정 색상, 시작일(시간), 종료일(시간), 시급)
	public int updateWork(MemberWork updateMemberWork) {
		return sqlSession.insert("CareerWork.updateWorkCal", updateMemberWork);
	}
// ===================================================================================================================
	// 차트에서 근무 data 조회(년&월 기준)
	public List<Map<String, String>> chartWork(String userId, String year, String month) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("userId", userId);
		paramMap.put("year", year);
		paramMap.put("month", month);
		List<Map<String, String>> result = null;
		result = sqlSession.selectList("CareerWork.chartWork", paramMap);
		System.out.println("result dao : " + result);
		
		return result;
	}
// ===================================================================================================================
	// 이벤트 수정 by 드래그
	public int updateCalDrag(MemberWork dragMemberWork) {
		return sqlSession.update("CareerWork.dragWorkUpdate", dragMemberWork);
	}
// ===================================================================================================================
}
