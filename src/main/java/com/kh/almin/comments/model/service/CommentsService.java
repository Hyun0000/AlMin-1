package com.kh.almin.comments.model.service;

import java.util.List;
import java.util.Map;

import com.kh.almin.comments.model.vo.CommentsCompany;

public interface CommentsService {
	// ==============================================================================
		// 모든 후기 키워드 가져오기
		public Map<String, List<String>> selectAllKeyWords();
	// ==============================================================================
		// 후기 작성
		public int insertComments(List<List<String>> commentsList, CommentsCompany commentsCompany);
	// ==============================================================================================================
		// 특정 공고의 전체 후기 조회
		public Map<String, Object> selectAllComments(int recruitNo);
		
		// ==============================================================================
		// ==============================================================================
		// ==============================================================================
		// ==============================================================================
}
