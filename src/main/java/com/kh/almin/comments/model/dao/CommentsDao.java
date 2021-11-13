package com.kh.almin.comments.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("commentsDao")
public class CommentsDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<String> selectAllCommentAir() {
		return sqlSession.selectList("Comments.selectAllCommentAir");
	}
}
