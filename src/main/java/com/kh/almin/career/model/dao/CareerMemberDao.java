package com.kh.almin.career.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.career.model.vo.MembersCareer;

@Repository("careerMemberDao")
public class CareerMemberDao {
	@Autowired
	private SqlSession sqlSession;
// ===================================================================================================================
	// 차트에서 개인 경력 조회(조건 : 회원 아이디)
	public List<Map<String, String>> selectCareerChart(String userId) throws Exception {
		List<Map<String, String>> result = null;
		result = sqlSession.selectList("careerMember.chartMember_select", userId);
		System.out.println("result dao : " + result);
		
		return result;
	}
// ===================================================================================================================
	// 개인 경력 insert
	public int insertCareer(MembersCareer insertCareerMember) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("careerMember.chartMember_insert", insertCareerMember);
	}
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
}
