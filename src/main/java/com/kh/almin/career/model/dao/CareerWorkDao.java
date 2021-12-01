package com.kh.almin.career.model.dao;

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
		return 0;
	}
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
}
