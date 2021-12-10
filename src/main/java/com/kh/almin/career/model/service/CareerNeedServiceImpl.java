package com.kh.almin.career.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.career.model.dao.CareerNeedDao;
import com.kh.almin.career.model.vo.MemberNeed;

@Service("careerNeedService")
public class CareerNeedServiceImpl implements CareerNeedService{
	@Autowired
	private CareerNeedDao careerNeedDao;
// ===================================================================================================================
	// calender 첫 page --> 지원일자 조회를 calender 첫 페이지로 결정
	@Override
	public List<Map<String, String>> selectCalList(String userId) throws Exception {
		return careerNeedDao.selectCalList(userId);
	}
// ===================================================================================================================
	// 구직 & 면접 일정 입력(insert)
	@Override
	public int insertNeed(MemberNeed memberNeed) throws Exception {
		return careerNeedDao.insertNeed(memberNeed);
	}
// ===================================================================================================================
	// 일정 삭제(조건 : 제목, 시작시간. 종료시간)
	@Override
	public int deleteCal(MemberNeed deleteMemberNeed) throws Exception {
		return careerNeedDao.deleteCal(deleteMemberNeed);
	}
// ===================================================================================================================
	// 일정 수정(조건 : 일정 번호(ID), 유저 아이디, 일정 제목, 일정 색상, 시작일(시간), 종료일(시간), 면접 or 구직 구분값)
	@Override
	public int updateCal(MemberNeed updateMemberNeed) throws Exception {
		return careerNeedDao.updateCal(updateMemberNeed);
	}
// ===================================================================================================================
	// 차트에서 구직 & 면접 횟수 조회(년&월 기준)
	@Override
	public List<Map<String, String>> chartNeed(String userId, String year, String month) throws Exception {
		return careerNeedDao.chartNeed(userId, year, month);
	}
// ===================================================================================================================
	// 이벤트 수정 by 드래그
	@Override
	public int updateCalDrag(MemberNeed dragMemberNeed) throws Exception {
		return careerNeedDao.updateCalDrag(dragMemberNeed);
	}
}
//===================================================================================================================
	// 회원의 현재 근무지 정보를 가져오는 method
//	@Override
//	public List<Map<String, String>> selectAllWork() {
//		return careerDao.selectAllWork();
//	}