package com.kh.almin.career.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.career.model.dao.CareerNeedDao;
import com.kh.almin.career.model.dao.CareerWorkDao;
import com.kh.almin.career.model.vo.MemberWork;

@Service("careerWorkService")
public class CareerWorkServiceImpl implements CareerWorkService {
	@Autowired
	private CareerWorkDao careerWorkDao;
// ===================================================================================================================
	// 근무 일정 전체 조회(select)
	@Override
	public List<Map<String, String>> selectWorkCalList(String userId) throws Exception {
		return careerWorkDao.selectWorkCalList(userId);
	}
// ===================================================================================================================	
	// 근무 일정 입력(insert)
	@Override
	public int insertWork(MemberWork insertMemberWork) throws Exception {
		return careerWorkDao.insertWork(insertMemberWork);
	}
// ===================================================================================================================	
// ===================================================================================================================	
// ===================================================================================================================	
// ===================================================================================================================
}
