package com.kh.almin.career.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.career.model.dao.CareerMemberDao;
import com.kh.almin.career.model.dao.CareerWorkDao;

@Service("careerMemberService")
public class CareerMemberServiceImpl implements CareerMemberService{
	@Autowired
	private CareerMemberDao careerMemberDao;
// ===================================================================================================================
	// 차트에서 개인 경력 조회(조건 : 회원 아이디)
	@Override
	public List<Map<String, String>> selectCareerChart(String userId) throws Exception {
		return careerMemberDao.selectCareerChart(userId);
	}
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
}
