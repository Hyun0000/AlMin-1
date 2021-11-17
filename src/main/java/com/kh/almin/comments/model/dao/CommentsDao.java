package com.kh.almin.comments.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.comments.model.vo.CommentsCompany;

@Repository("commentsDao")
public class CommentsDao {
	@Autowired
	private SqlSession sqlSession;
// ==============================================================================================================
	// 모든 후기 키워드 가져오기 to insert
	public Map<String, List<String>> selectAllKeyWords() {
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
	public int insertComments(List<List<String>> commentsList, CommentsCompany commentsCompany) {
		Map<String, Object> insertMap = new HashMap<String, Object>();
		// ex) insertMap.put("0", commentsList.get(0));
		String[] tableName = {"insertGood", "insertBad", "insertCon", "insertAir", "insertPay"};

		// insert 작업을 시작할 때마다 추가될 변수
		int result = 0;
		
		// 최종적으로 return할 변수
		int resultCount = 0;
		
		/*
		 * CommentsCompany commentsCompany가 있으므로 commentsList 길이보다 (+1) 한다.
		 * 
		 * insert 순서
		 * 1. commentsList에 있는 각 키워드들을 먼저 insert --> Comments.insertComments (i = 0 ~ 4)
		 * 2. CommentsCompany VO에 set한 data를 insert --> Comments.insertCommentsKeyword (i = 5)
		 */
		
		// 얘 먼저하고
		result = sqlSession.insert("Comments.insertComments", commentsCompany);
		if (result != 0) {
			resultCount++;
		} else {
			System.out.println("insert 중 문제가 발생했다.");
		}
		
		// 키워드를 나중에 넣는다.
		for (int i = 0; i < commentsList.size(); i++) {
				insertMap.put("category", tableName[i]);
				insertMap.put("writer", commentsCompany.getCcWriter());
				insertMap.put("recruitNo", commentsCompany.getCcRecruitNo());
				insertMap.put("list", commentsList.get(i));	
				result = sqlSession.insert("Comments.insertCommentsKeyword", insertMap);
			if (result != 0) {
				resultCount++;
			} else {
				System.out.println("insert 중 문제가 발생했다.");
			}
		}
//		for (int i = 0; i < (commentsList.size() + 1); i++) {
//				if (i == 5) {
//					result = sqlSession.insert("Comments.insertComments", commentsCompany);
//				} else {
//					insertMap.put("category", tableName[i]);
//					insertMap.put("writer", commentsCompany.getCcWriter());
//					insertMap.put("recruitNo", commentsCompany.getCcRecruitNo());
//					insertMap.put("list", commentsList.get(i));	
//					result = sqlSession.insert("Comments.insertCommentsKeyword", insertMap);
//				}
//				
//				if (result != 0) {
//					resultCount++;
//				} else {
//					System.out.println("insert 중 문제가 발생했다.");
//				}
//			}
		System.out.println("result : " + result);
		
		// (resultCount = 6)가 돼야 후기 insert 성공 
		System.out.println("resultCount : " + resultCount);
		return resultCount;
	}
// ==============================================================================================================
	// 특정 공고의 전체 후기 조회
	public Map<String, Object> selectAllComments(int recruitNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		String[] tableName = {"selectGood", "selectBad", "selectCon", "selectAir", "selectPay"};
		
//		for (int i = 0; i < tableName.length; i++) {
//			map.put("commentsVO", commentsVO);
//		}
		
		List<Map<String, Object>> test = sqlSession.selectList("Comments.selectKeywords", recruitNo);
		System.out.println("test : " + test);
		
		for (Map<String, Object> map2 : test) {
			System.out.println(map2.get("AIR_NAME"));
		}
		
		// 2. COMMENTS_COMPANY에서 후기 가져오기
		List<CommentsCompany> commentsVO = sqlSession.selectList("Comments.selectCommentVo", recruitNo);
		map.put("commentsVO", commentsVO);
		System.out.println("commentsVO : " + commentsVO);
		
		
		return map;
	}
}



