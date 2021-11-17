package com.kh.almin.comments.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.comments.model.dao.CommentsDao;
import com.kh.almin.comments.model.vo.CommentsCompany;

@Service("commentsService")
public class CommentsServiceImpl implements CommentsService {
	@Autowired
	private CommentsDao commentsDao;

// ==============================================================================
	// 모든 후기 키워드 가져오기
	@Override
	public Map<String, List<String>> selectAllKeyWords() {
		return commentsDao.selectAllKeyWords();
	}
// ==============================================================================
	// 후기 작성
	@Override
	public int insertComments(List<List<String>> commentsList, CommentsCompany commentsCompany) {
		return commentsDao.insertComments(commentsList, commentsCompany);
	}
// ==============================================================================
	// 특정 공고의 전체 후기 조회
	@Override
	public Map<String, Object> selectAllComments(int recruitNo) {
		return commentsDao.selectAllComments(recruitNo);
	}
// ==============================================================================
// ==============================================================================
// ==============================================================================
}
