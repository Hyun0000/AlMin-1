package com.kh.almin.career.model.service;

import java.util.List;
import java.util.Map;

import com.kh.almin.career.model.vo.MemberWork;

public interface CareerWorkService {
// ===================================================================================================================
	// 근무 일정 전체 조회(select)
	public List<Map<String, String>> selectWorkCalList(String userId) throws Exception;
// ===================================================================================================================
	// 근무 일정 입력(insert)
	public int insertWork(MemberWork insertMemberWork) throws Exception;
// ===================================================================================================================
// ===================================================================================================================
// ===================================================================================================================
}
