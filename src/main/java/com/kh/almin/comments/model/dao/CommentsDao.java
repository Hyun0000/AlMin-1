package com.kh.almin.comments.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("commentsDao")
public class CommentsDao {
	@Autowired
	private SqlSession sqlSession;
// ==============================================================================================================
	// 모든 후기 키워드 가져오기
	public Map<String, List<String>> selectAllComments() {
		Map<String, List<String>> commentsMap = new HashMap<String, List<String>>();
//		commentsMap.put("COMMENTS_GOOD", sqlSession.selectList("Comments.selectAllCommentsGood"));
//		commentsMap.put("COMMENTS_BAD", sqlSession.selectList("Comments.selectAllCommentsBad"));
//		commentsMap.put("COMMENTS_CONDITION", sqlSession.selectList("Comments.selectAllCommentsCondition"));
//		commentsMap.put("COMMENTS_AIR", sqlSession.selectList("Comments.selectAllCommentsAir"));
//		commentsMap.put("COMMENTS_PAY", sqlSession.selectList("Comments.selectAllCommentsPay"));
		
		commentsMap.put("1", sqlSession.selectList("Comments.selectAllCommentsGood"));
		commentsMap.put("2", sqlSession.selectList("Comments.selectAllCommentsBad"));
		commentsMap.put("3", sqlSession.selectList("Comments.selectAllCommentsCondition"));
		commentsMap.put("4", sqlSession.selectList("Comments.selectAllCommentsAir"));
		commentsMap.put("5", sqlSession.selectList("Comments.selectAllCommentsPay"));
		return commentsMap;
	}
// ==============================================================================================================
	// 후기 작성
	public int insertComments(List<List<String>> commentsList) {
		// Map<String, List<String>> insertMap = new HashMap<String, List<String>>();
		int result = 0;
		
		String[] tableName = {"insertGood", "insertBad", "insertCon", "insertAir", "insertPay"};
		// String[] tableName = {"COMMENTS_GOOD_MAP", "COMMENTS_BAD_MAP", "COMMENTS_PAY_MAP", "COMMENTS_CONDITION_MAP", "COMMENTS_AIR_MAP"};
		// List<String> find = new ArrayList<String>();
		// find.add("0");

//		for (int i = 0; i < commentsList.size(); i++) {
//			result = sqlSession.insert("Comments." + tableName[i], commentsList.get(i));
//		}
//		System.out.println("result : " + result);
		return result;
	}
}



