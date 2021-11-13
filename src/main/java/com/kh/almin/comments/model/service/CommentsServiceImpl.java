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

	@Override
	public Map<String, List<String>> selectAllComments() {
		return commentsDao.selectAllComments();
	}

}
