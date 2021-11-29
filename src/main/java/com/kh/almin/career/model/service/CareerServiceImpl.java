package com.kh.almin.career.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.career.model.dao.CareerDao;
import com.kh.almin.career.model.vo.MemberNeed;

@Service("careerService")
public class CareerServiceImpl implements CareerService{
	@Autowired
	private CareerDao careerDao;
// ===================================================================================================================
	// calender 첫 page --> 지원일자 조회를 calender 첫 페이지로 결정
	@Override
	public List<Map<String, String>> selectCalList(String userId) throws Exception {
		return careerDao.selectCalList(userId);
	}
// ===================================================================================================================
	// 구직 & 면접 일정 입력(insert)
	@Override
	public int insertNeed(MemberNeed memberNeed) throws Exception {
		return careerDao.insertNeed(memberNeed);
	}
// ===================================================================================================================
	// 일정 삭제(조건 : 제목, 시작시간. 종료시간)
	@Override
	public int deleteCal(MemberNeed memberNeed) throws Exception {
		return careerDao.deleteCal(memberNeed);
	}
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
}
//===================================================================================================================
	// 회원의 현재 근무지 정보를 가져오는 method
//	@Override
//	public List<Map<String, String>> selectAllWork() {
//		return careerDao.selectAllWork();
//	}