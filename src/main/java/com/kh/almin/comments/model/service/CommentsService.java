package com.kh.almin.comments.model.service;

import java.util.List;
import java.util.Map;

import com.kh.almin.comments.model.vo.CommentsCompany;

public interface CommentsService {
// ==============================================================================
	// 모든 후기 키워드 가져오기(insert)
	public Map<String, List<String>> selectAllKeyWords() throws Exception;
// ==============================================================================
	// 후기 작성(insert)
	public int insertComments(List<List<String>> commentsList, CommentsCompany commentsCompany, String insertOrUpdate) throws Exception;
// ==============================================================================================================
	// 특정 공고의 전체 후기 조회(select)
	// public Map<String, Object> selectAllComments(int recruitNo) throws Exception;
	public Map<String, Object> selectAllComments(int recruitNo, String id) throws Exception;
	// public List<List<String>> selectAllComments(int recruitNo);
// ==============================================================================
	// 후기 삭제 --> 조건 : 공고번호(CC_RECRUIT_NO) & 작성자 ID
	public int deleteComment(int rNo , String userId) throws Exception;
// ==============================================================================
	// 현재 접속자의 해당 공고 후기 작성 유무 확인
	public int findComments(String rNo , String userId) throws Exception;
// ==============================================================================
// ==============================================================================
}
