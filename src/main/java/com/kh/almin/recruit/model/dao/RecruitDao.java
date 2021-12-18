package com.kh.almin.recruit.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.almin.recruit.model.vo.LikeRecruit;
import com.kh.almin.recruit.model.vo.Reason;
import com.kh.almin.recruit.model.vo.Recruit;
import com.kh.almin.recruit.model.vo.ReportRecruit;
import com.kh.almin.recruit.model.vo.SearchRecruit;

@Repository
public class RecruitDao {
	private static final Logger logger = LoggerFactory.getLogger(RecruitDao.class);
	@Autowired
	private SqlSession sqlSession;

	public List<Recruit> getReport() throws Exception {
		return sqlSession.selectList("Recruit.listReport");
	}

	public List<Recruit> recruitList() throws Exception {
		return sqlSession.selectList("Recruit.jobinfoList");
	}

	public Recruit detailjobinfo(int recruitNo) throws Exception {
		return sqlSession.selectOne("Recruit.detailjobinfo", recruitNo);
	}

	public List<Recruit> searchRecruit(SearchRecruit searchRecruit) throws Exception {
		return sqlSession.selectList("Recruit.searchRecruit", searchRecruit);
	}

	public int reportRecruit(int recruitNo) throws Exception {
		return sqlSession.update("Recruit.updatePolice", recruitNo);
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

	public int doReport(ReportRecruit reportRecruit) throws Exception {
		return sqlSession.insert("Recruit.doReport", reportRecruit);
	}

	public int listReason(Reason reason) throws Exception {
		return sqlSession.selectOne("Recruit.listReason", reason);
	}
	
	public int countCat(int recruitJobType) throws Exception{
		return sqlSession.selectOne("Recruit.countCat", recruitJobType);
	}
	
	public List<Recruit> appForYou(String memberId) throws Exception {
		return sqlSession.selectList("Recruit.appForYou", memberId);
	}
	
	public int insertRecruit(Recruit r) throws Exception{
		return sqlSession.insert("Recruit.insertRecruit",r);
	}
	
	public int updateRecruit(Recruit r) throws Exception{
		return sqlSession.update("Recruit.updateRecruit",r);
	}
	
	public int deleteRecruit(int recruitNo) throws Exception{
		return sqlSession.delete("Recruit.deleteRecruit",recruitNo);
	}
	
	public int checkReport(ReportRecruit reportRecruit) throws Exception {
		return sqlSession.selectOne("Recruit.checkReport", reportRecruit);
	}
	
	public List<Recruit> selectAllRecruit(Recruit r) throws Exception{
		List<Recruit> recruit=sqlSession.selectList("Recruit.selectAllRecruit",r);
		return recruit;
	}
}