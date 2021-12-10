package com.kh.almin.career.model.service;

import java.util.List;
import java.util.Map;

import com.kh.almin.career.model.vo.MemberNeed;

public interface CareerNeedService {
// ===================================================================================================================
	// calender 첫 page --> 지원일자 조회를 calender 첫 페이지로 결정
	public List<Map<String, String>> selectCalList(String userId) throws Exception;
// ===================================================================================================================
	// 구직 & 면접 일정 입력(insert)
	public int insertNeed(MemberNeed memberNeed) throws Exception;
// ===================================================================================================================
	// 일정 삭제(조건 : 제목, 시작시간. 종료시간)
	public int deleteCal(MemberNeed memberNeed) throws Exception;
// ===================================================================================================================
	// 일정 수정(조건 : 일정 번호(ID), 유저 아이디, 일정 제목, 일정 색상, 시작일(시간), 종료일(시간), 면접 or 구직 구분값)
	public int updateCal(MemberNeed updateMemberNeed) throws Exception;
// ===================================================================================================================
	// 차트에서 구직 & 면접 횟수 조회(년&월 기준)
	public List<Map<String, String>> chartNeed(String userId, String year, String month) throws Exception;
// ===================================================================================================================
	// 이벤트 수정 by 드래그
	public int updateCalDrag(MemberNeed dragMemberNeed) throws Exception;
}
// ===================================================================================================================
// 회원의 현재 근무지 정보를 가져오는 method
// public List<Map<String, String>> selectAllWork();