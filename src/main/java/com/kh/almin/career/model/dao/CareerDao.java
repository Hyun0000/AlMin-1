package com.kh.almin.career.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("careerDao")
public class CareerDao {
	@Autowired
	private SqlSession sqlSession;
// ===================================================================================================================
	// 회원의 현재 근무지 정보를 가져오는 method
	public List<Map<String, String>> selectAllWork() {
		List<Map<String, String>> testData = sqlSession.selectList("Career.selectAllWork");
		System.out.println("testData : " + testData);
		return testData;
		/*
		 * [
		 * {COMPANY_NAME=(주)애플, WORK_DAY=23, WORK_MONEY=9000, MEMBER_ID=user01},
		 * {COMPANY_NAME=(주)키위, WORK_DAY=23, WORK_MONEY=9000, MEMBER_ID=user01},
		 * {COMPANY_NAME=(주)오렌지, WORK_DAY=23, WORK_MONEY=9000, MEMBER_ID=user01},
		 * {COMPANY_NAME=(주)포도, WORK_DAY=23, WORK_MONEY=9000, MEMBER_ID=user01},
		 * {COMPANY_NAME=(주)멜론, WORK_DAY=23, WORK_MONEY=9000, MEMBER_ID=user01}
		 * ]
		 */
	}
	
}
