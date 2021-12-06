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

	// mapper에서 공통적으로 사용할 조건 table Array
	String[] tableName = {"COMMENTS_GOOD_MAP", "COMMENTS_BAD_MAP", "COMMENTS_CONDITION_MAP", "COMMENTS_AIR_MAP", "COMMENTS_PAY_MAP"};
	
// ==============================================================================================================
	// 모든 후기 키워드 가져오기(insert)
	public Map<String, List<String>> selectAllKeyWords() throws Exception {
		Map<String, List<String>> commentsMap = new HashMap<String, List<String>>();
		
		for (int i = 0; i < tableName.length; i++) {
			commentsMap.put("" + (i + 1), sqlSession.selectList("Comments." + tableName[i]));
		}
		return commentsMap;
	}
// ==============================================================================================================
	// 후기 작성(insert)
	public int insertComments(List<List<String>> commentsList, CommentsCompany commentsCompany, String insertOrUpdate) throws Exception {
		Map<String, Object> insertMap = new HashMap<String, Object>();
		
		// DB 작업을 시작할 때마다 추가될 변수
		int result = 0;
		
		// 최종적으로 return할 변수
		int resultCount = 0;
		System.out.println("dao 진입");
		System.out.println("commentsList : " + commentsList);
		System.out.println("commentsCompany : " + commentsCompany);
		System.out.println("insertOrUpdate : " + insertOrUpdate);
		if (insertOrUpdate.equals("update")) {
			// 1. 기존 후기의 키워드 지우기
			System.out.println("수정 작업 진입");
			
			Map<String, Object> deleteMap = new HashMap<String, Object>();
			for (int i = 0; i < tableName.length; i++) {
				deleteMap.put("category", tableName[i]);
				deleteMap.put("id", commentsCompany.getCcWriter());
				deleteMap.put("recruitNo", commentsCompany.getCcRecruitNo());
				
				result = sqlSession.delete("Comments.deleteComment", deleteMap);
				if (result != 0) {System.out.println("키워드 삭제 성공"); resultCount++;}
			}
			
			// 2. 기존 후기 update --> 조건 : 유저ID(CC_WRITER) & 공고번호(CC_RECRUIT_NO)
			// 수정할 사항 --> 후기 한줄평(CC_CONTENT) & 근로 계약서 작성 여부(CC_CONTRACT)
			deleteMap.put("writer", commentsCompany.getCcWriter());
			deleteMap.put("recruitNo", commentsCompany.getCcRecruitNo());
			deleteMap.put("content", commentsCompany.getCcContent());
			deleteMap.put("contract", commentsCompany.getCcContract());
			result = sqlSession.delete("Comments.updateComment", deleteMap);
			if (result != 0) {System.out.println("후기 수정 성공"); resultCount++;}
			
		} else if(insertOrUpdate.equals("insert")) {
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			// 1. COMMENTS_COMPANY insert(PK-FK 관게로 인해 해당 작업부터 먼저한다.)
			result = sqlSession.insert("Comments.insertComments", commentsCompany);
			if (result != 0) { resultCount++;}
			else {System.out.println("insert 중 문제가 발생했다.");}
		}
		
		System.out.println("dao insert keyword");
		// 2. 5개  mapping table insert
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
		System.out.println("result : " + result);
		
		// (resultCount = 6(insert) or 11(update))가 돼야 후기 insert 성공 
		System.out.println("resultCount : " + resultCount);
		return resultCount;
	}
// ==============================================================================================================
	// 특정 공고의 전체 후기 조회(select) & 후기 수정을 위해 특정 유저의 후기 data 가져오기
	public Map<String, Object> selectAllComments(int rNo , String userId) throws Exception {
	// public List<List<String>> selectAllComments(int recruitNo) {
		// 반환용 map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// COMMENTS_COMPANY 테이블에서 data를 가져올때 인자로 전달할 map
		Map<String, Object> firstMap = new HashMap<String, Object>();
		
		// mapping table에서 data를 가져올때 인자로 전달할 map
		Map<String, Object> selectKeywordMap = new HashMap<String, Object>();
		
		// userID = ""  -->  전체 후기를 조회할 때
		if (userId == "") {
			System.out.println("dao : 전체 후기 조회 in");
			firstMap.put("recruitNo", rNo);
			
			// 1. COMMENTS_COMPANY에서 후기 가져오기
			List<CommentsCompany> commentsVO = sqlSession.selectList("Comments.selectCommentVo", firstMap);
			// 이건 다 분류하고 난 다음에 하기
			resultMap.put("commentsVO", commentsVO);

			// 2. 각 작성자의 후기별 키워드 가져오기
			for (CommentsCompany commentsCompany : commentsVO) {
				List<List<String>> keyList = new ArrayList<List<String>>();
				for (int i = 0; i < tableName.length; i++) {
					
					System.out.println("commentsCompany.getCcWriter() : " + commentsCompany.getCcWriter());
					
					selectKeywordMap.put("category", tableName[i]);
					selectKeywordMap.put("recruitNo", rNo);
					selectKeywordMap.put("writer", commentsCompany.getCcWriter());
					
					List<String> resultList = sqlSession.selectList("Comments.selectKeywords", selectKeywordMap);
					System.out.println("test" + i + " : " + resultList);
					
					keyList.add(resultList);
					
					if (i == 4) {
						resultMap.put(commentsCompany.getCcWriter(), keyList);
					}
				}
			}
		} else { // 넘어온 iserID가 있다면
			System.out.println("dao : 특정 후기 조회 in");
			firstMap.put("recruitNo", rNo);
			firstMap.put("userId", userId);
			
			// 1. COMMENTS_COMPANY에서 후기 가져오기
			List<CommentsCompany> commentsVO = sqlSession.selectList("Comments.selectCommentVo", firstMap);
			// 이건 다 분류하고 난 다음에 하기
			resultMap.put("commentsVO", commentsVO);
			
			// 2. 각 작성자의 후기별 키워드 가져오기
			for (CommentsCompany commentsCompany : commentsVO) {
				List<List<String>> keyList = new ArrayList<List<String>>();
				for (int i = 0; i < tableName.length; i++) {
					
					System.out.println("commentsCompany.getCcWriter() : " + commentsCompany.getCcWriter());
					
					selectKeywordMap.put("category", tableName[i]);
					selectKeywordMap.put("recruitNo", rNo);
					selectKeywordMap.put("writer", commentsCompany.getCcWriter());
					
					// List<Map<String, Object>> resultListMap = sqlSession.selectList("Comments.selectKeywords", selectMap);
					List<String> resultList = sqlSession.selectList("Comments.selectKeywords", selectKeywordMap);
					System.out.println("test" + i + " : " + resultList);
					
//					Map<String, List<String>> commentsMap = new HashMap<String, List<String>>();
//					
//					for (int j = 0; j < tableName.length; j++) {
//						commentsMap.put("" + (j + 1), sqlSession.selectList("Comments." + tableName[j]));
//					}
//					for (int j = 0; j < resultList.size(); j++) {
//						System.out.println("resultList.get(" + j + ") : " + resultList.get(j));
//					}
					
					keyList.add(resultList);
					
					if (i == 4) {
						resultMap.put(commentsCompany.getCcWriter(), keyList);
					}
				}
			}
		}
		return resultMap;
	}
// ==============================================================================
	// 후기 삭제 --> 조건 : 공고번호(CC_RECRUIT_NO) & 작성자 ID
	public int deleteComment(int recruitNo, String id) throws Exception {
		System.out.println("dao 후기 삭제 진입");
		// 키워드 1
		String[] keyArrOne = {"GOOD", "BAD", "CONDITION", "AIR", "PAY"};
		
		// 키워드 2
		String[] keyArrtwo = {"CGM", "CBM", "CCM", "CAM", "CPM"};
		
		// DB를 갖다올 때마다 conut될 변수
		int result = 0;
		
		// return할 변수
		int resultCount = 0;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("recruitNo", recruitNo);
		paramMap.put("id", id);
		
		// 1. 5개의 mapping table에서 조건에 맞는 키워드 모두 지우기(PK-FK 관게로 인해 해당 작업부터 먼저한다.)
		for (int i = 0; i < tableName.length; i++) {
			System.out.println("dao 키워드 삭제 진입");
			
			paramMap.put("category", tableName[i]);
			result = sqlSession.delete("Comments.deleteComment", paramMap);
			if (result != 0) {System.out.println("키워드 삭제 성공"); resultCount++;}
		}
		
		// 2. COMMENTS_COMPANY에서 후기 지우기
		System.out.println("dao 후기 삭제 진입");
		paramMap.put("category", "lastDelete");
		result = sqlSession.delete("Comments.deleteComment", paramMap);
		if (result != 0) {System.out.println("후기 삭제 성공"); resultCount++;}
		
		// resultCount = 6 이어야 모두 삭제 완료
		System.out.println("resultCount : " + resultCount);
		return resultCount;
	}
//==============================================================================
	// 현재 접속자의 해당 공고 후기 작성 유무 확인
	public int findComments(String rNo, String userId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("recruitNo", rNo);
		paramMap.put("id", userId);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = sqlSession.selectOne("Comments.findComments", paramMap);
		System.out.println("resultMap : " + resultMap);
		return 0;
	}
}








//// 특정 공고의 전체 후기 조회(select)
//public Map<String, Object> selectAllComments(int recruitNo) throws Exception {
//// public List<List<String>> selectAllComments(int recruitNo) {
//	// 반환용 map
//	Map<String, Object> resultMap = new HashMap<String, Object>();
//	
//	// 1. COMMENTS_COMPANY에서 후기 가져오기
//	List<CommentsCompany> commentsVO = sqlSession.selectList("Comments.selectCommentVo", recruitNo);
//	// 이건 다 분류하고 난 다음에 하기
//	resultMap.put("commentsVO", commentsVO);
//
//	// 2. 각 작성자의 후기별 키워드 가져오기
//	for (CommentsCompany commentsCompany : commentsVO) {
//		List<List<String>> keyList = new ArrayList<List<String>>();
//		for (int i = 0; i < tableName.length; i++) {
//			// select용 map
//			Map<String, Object> selectMap = new HashMap<String, Object>();
//			
//			System.out.println("commentsCompany.getCcWriter() : " + commentsCompany.getCcWriter());
//			
//			selectMap.put("category", tableName[i]);
//			selectMap.put("recruitNo", recruitNo);
//			selectMap.put("writer", commentsCompany.getCcWriter());
//			
//			// List<Map<String, Object>> resultListMap = sqlSession.selectList("Comments.selectKeywords", selectMap);
//			List<String> resultList = sqlSession.selectList("Comments.selectKeywords", selectMap);
//			System.out.println("test" + i + " : " + resultList);
//			
//			keyList.add(resultList);
//			
//			if (i == 4) {
//				resultMap.put(commentsCompany.getCcWriter(), keyList);
//			}
//		}
//	}
//	System.out.println("resultMap : " + resultMap);
//	
//	System.out.println("=========================================");
//	System.out.println("resultMap : " + resultMap);
//	System.out.println("=========================================");
//	for (CommentsCompany commentsCompany : commentsVO) {
//		System.out.println("commentsCompany.getCcWriter() : " + commentsCompany.getCcWriter());
//	}
//	System.out.println("=========================================");
//	System.out.println("commentsVO : " + commentsVO);
//	return resultMap;
//}












