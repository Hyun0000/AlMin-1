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
	// 근무 일정 삭제(조건 : 유저 아이디, 일정 번호)
	@Override
	public int deleteWork(MemberWork deleteMemberWork) throws Exception {
		return careerWorkDao.deleteWork(deleteMemberWork);
	}
// ===================================================================================================================	
	// 근무 일정 수정(받는 값 : 일정 번호(ID), 유저 아이디, 일정 제목, 일정 색상, 시작일(시간), 종료일(시간), 시급)
	@Override
	public int updateWork(MemberWork updateMemberWork) throws Exception {
		return careerWorkDao.updateWork(updateMemberWork);
	}
// ===================================================================================================================	
	// 차트에서 근무 data 조회(년&월 기준)
	@Override
	public List<Map<String, String>> chartWork(String userId, String year, String month) throws Exception {
		return careerWorkDao.chartWork(userId, year, month);
	}
// ===================================================================================================================
	// 이벤트 수정 by 드래그
	@Override
	public int updateCalDrag(MemberWork dragMemberWork) throws Exception {
		return  careerWorkDao.updateCalDrag(dragMemberWork);
	}
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
}
