package com.kh.almin.myrecruit.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.myrecruit.model.dao.MyRecruitDao;
import com.kh.almin.myrecruit.model.vo.MyRecruit;

@Service("myRecruitService")
public class MyRecruitServiceImpl implements MyRecruitService {
	@Autowired
	private MyRecruitDao myRecruitDao;
// ==============================================================================
	// 특정 공고 지원자 전체 조회(조건  : 공고 번호)
	@Override
	public List<Map<String, Object>> selectRecruitMember(int recruitNo) throws Exception {
		return myRecruitDao.selectRecruitMember(recruitNo);
	}
// ==============================================================================
	// 공고 지원하기 버튼 클릭했을때 --> 개인 회원으로 로그인(받는 값 : 아이디 & 공고번호)
	@Override
	public int recruitGo(MyRecruit myRecruit) throws Exception {
		return myRecruitDao.recruitGo(myRecruit);
	}
// ==============================================================================
// ==============================================================================
// ==============================================================================
// ==============================================================================
// ==============================================================================
}
