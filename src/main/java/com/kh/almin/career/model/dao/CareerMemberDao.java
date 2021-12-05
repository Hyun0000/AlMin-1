package com.kh.almin.career.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("careerMemberDao")
public class CareerMemberDao {
	@Autowired
	private SqlSession sqlSession;
// ===================================================================================================================
	// 차트에서 개인 경력 조회(조건 : 회원 아이디)
	public List<Map<String, String>> selectCareerChart(String userId) throws Exception {
//		Map<String, String> paramMap = new HashMap<String, String>();
//		paramMap.put("userId", userId);
		List<Map<String, String>> result = null;
//		List<Map<String, Integer>> result2 = null;
		result = sqlSession.selectList("careerMember.chartMember_select", userId);
		System.out.println("result dao : " + result);
		
		return result;
	}
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
}
