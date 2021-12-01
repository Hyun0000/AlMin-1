package com.kh.almin.recruit.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.recruit.model.vo.LikeRecruit;
import com.kh.almin.recruit.model.vo.Recruit;
import com.kh.almin.recruit.model.vo.SearchRecruit;

@Repository
public class RecruitDao {
	private static final Logger logger = LoggerFactory.getLogger(RecruitDao.class);
	@Autowired
	private SqlSession sqlSession;

	public List<Recruit> getReport() throws Exception {
		List<Recruit> recruits = sqlSession.selectList("Recruit.listReport");
		logger.info(recruits.toString());
		System.out.println("여기여기");
		System.out.println(recruits.size());
		return recruits;
	}

	public List<Recruit> recruitList() throws Exception {
		List<Recruit> recruit = sqlSession.selectList("Recruit.jobinfoList");
		return recruit;
	}

	public Recruit detailjobinfo(int recruitNo) throws Exception {
		Recruit recruit = sqlSession.selectOne("Recruit.detailjobinfo", recruitNo);
		return recruit;
	}

	public List<Recruit> searchRecruit(SearchRecruit searchRecruit) throws Exception {
		List<Recruit> recruit = sqlSession.selectList("Recruit.searchRecruit", searchRecruit);
		return recruit;
	}

	public int reportRecruit(int recruitNo) throws Exception {
		return sqlSession.delete("Recruit.updatePolice", recruitNo);
	}

	public int likeRecruit(LikeRecruit likeRecruit) throws Exception {
		return sqlSession.insert("Recruit.doLike", likeRecruit);
	}

	public int dislikeRecruit(LikeRecruit likeRecruit) throws Exception {
		return sqlSession.delete("Recruit.disLike", likeRecruit);
	}

	public List<Recruit> listLike(String memberId) throws Exception {
		return sqlSession.selectList("Recruit.listLike", memberId);
	}

	public int checkLike(LikeRecruit likeRecruit) throws Exception {
		return sqlSession.selectOne("Recruit.checkLike", likeRecruit);
	}
}