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
	// 모든 후기 키워드 가져오기(insert)
	@Override
	public Map<String, List<String>> selectAllKeyWords() throws Exception {
		return commentsDao.selectAllKeyWords();
	}
// ==============================================================================
	// 후기 작성(insert)
	@Override
	public int insertComments(List<List<String>> commentsList, CommentsCompany commentsCompany) throws Exception {
		return commentsDao.insertComments(commentsList, commentsCompany);
	}
// ==============================================================================
	// 특정 공고의 전체 후기 조회(select)
	@Override
	// public List<List<String>> selectAllComments(int recruitNo) {
	public Map<String, Object> selectAllComments(int recruitNo) throws Exception {
		return commentsDao.selectAllComments(recruitNo);
	}
// ==============================================================================
	// 후기 삭제 --> 조건 : 공고번호(CC_RECRUIT_NO) & 작성자 ID
	@Override
	public int deleteComment(int recruitNo, String id) throws Exception {
		return commentsDao.deleteComment(recruitNo, id);
	}
// ==============================================================================
// ==============================================================================
}
