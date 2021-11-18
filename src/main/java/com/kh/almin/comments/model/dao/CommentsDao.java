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
	// 모든 후기 키워드 가져오기(insert)
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
	// 후기 작성(insert)
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
		System.out.println("result : " + result);
		
		// (resultCount = 6)가 돼야 후기 insert 성공 
		System.out.println("resultCount : " + resultCount);
		return resultCount;
	}
// ==============================================================================================================
	// 특정 공고의 전체 후기 조회(select)
	public Map<String, Object> selectAllComments(int recruitNo) {
	// public List<List<String>> selectAllComments(int recruitNo) {
		// 반환용 map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String[] tableName = {"selectGood", "selectBad", "selectCon", "selectAir", "selectPay"};
		
		
		// 1. COMMENTS_COMPANY에서 후기 가져오기
		List<CommentsCompany> commentsVO = sqlSession.selectList("Comments.selectCommentVo", recruitNo);
		// 이건 다 분류하고 난 다음에 하기
		resultMap.put("commentsVO", commentsVO);

		
		
		// 2. 각 작성자의 후기별 키워드 가져오기
		for (CommentsCompany commentsCompany : commentsVO) {
			List<List<String>> keyList = new ArrayList<List<String>>();
			for (int i = 0; i < tableName.length; i++) {
				// select용 map
				Map<String, Object> selectMap = new HashMap<String, Object>();
				
				System.out.println("commentsCompany.getCcWriter() : " + commentsCompany.getCcWriter());
				
				selectMap.put("category", tableName[i]);
				selectMap.put("recruitNo", recruitNo);
				selectMap.put("writer", commentsCompany.getCcWriter());
				
				// List<Map<String, Object>> resultListMap = sqlSession.selectList("Comments.selectKeywords", selectMap);
				List<String> resultList = sqlSession.selectList("Comments.selectKeywords", selectMap);
				System.out.println("test" + i + " : " + resultList);
				
				int shitNum = 0;
				
				keyList.add(resultList);
				
				if (i == 4) {
					resultMap.put(commentsCompany.getCcWriter(), keyList);
				}
				
//				for (int j = 0; j < resultListMap.size(); j++) {
//					switch (shitNum) {
//					case 0:
//						resultListMap.get(j).get("GOOD_NAME"); shitNum++;
//						break;
//					case 1:
//						resultListMap.get(j).get("BAD_NAME"); shitNum++;
//						break;
//						
//					case 2:
//						resultListMap.get(j).get("CONDITION_NAME"); shitNum++;
//						break;
//						
//					case 3:
//						resultListMap.get(j).get("AIR_NAME"); shitNum++;
//						break;
//						
//					case 4:
//						resultListMap.get(j).get("PAY_NAME"); shitNum++;
//						break;
//
//					}
//					
//				}
				// resultMap.put(commentsCompany.getCcWriter() + i, resultListMap);
			}
		}
		System.out.println("resultMap : " + resultMap);
		
		System.out.println("=========================================");
		System.out.println("resultMap : " + resultMap);
		System.out.println("=========================================");
		for (CommentsCompany commentsCompany : commentsVO) {
			System.out.println("commentsCompany.getCcWriter() : " + commentsCompany.getCcWriter());
		}
		System.out.println("=========================================");
		System.out.println("commentsVO : " + commentsVO);
		
//		// 3. 각 user가 작성한 키워드 별로 분리
//        // 방법 01 : entrySet()
//        for (Map.Entry<String, Object> entry : resultMap.entrySet()) {
//            System.out.println("[key]:" + entry.getKey() + ", [value]:" + entry.getValue());
//		}
//        
//        System.out.println("=========================================");
//        // 방법 02 : keySet()
//        for (String key : resultMap.keySet()) {
//        	System.out.println("[key]:" + key);
//        }
//		
//		ArrayList<Map<String, String>> list1 = (ArrayList<Map<String, String>>) resultMap.get("selectCon");
//		System.out.println("list1.get(0) : " + list1.get(0));
//		System.out.println("list1.get(0).get(\"CONDITION_NAME\") : " + list1.get(0).get("CONDITION_NAME"));
//		System.out.println("list1.get(0).get(\"CCM_CC_WRITER\") : " + list1.get(0).get("CCM_CC_WRITER"));
		
		// return keyList;
		return resultMap;
	}
}



