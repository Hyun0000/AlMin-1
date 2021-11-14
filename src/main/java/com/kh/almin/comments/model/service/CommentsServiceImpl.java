package com.kh.almin.comments.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.comments.model.dao.CommentsDao;

@Service("commentsService")
public class CommentsServiceImpl implements CommentsService {
	@Autowired
	private CommentsDao commentsDao;

// ==============================================================================
	// 모든 후기 키워드 가져오기
	@Override
	public Map<String, List<String>> selectAllComments() {
		return commentsDao.selectAllComments();
	}
// ==============================================================================
	// 후기 작성
	@Override
	public int insertComments(List<List<String>> commentsList) {
		return commentsDao.insertComments(commentsList);
	}
// ==============================================================================
// ==============================================================================
// ==============================================================================
// ==============================================================================
}
