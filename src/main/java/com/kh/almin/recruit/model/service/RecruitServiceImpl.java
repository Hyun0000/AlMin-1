package com.kh.almin.recruit.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.recruit.model.dao.RecruitDao;
import com.kh.almin.recruit.model.vo.CountCat;
import com.kh.almin.recruit.model.vo.LikeRecruit;
import com.kh.almin.recruit.model.vo.Reason;
import com.kh.almin.recruit.model.vo.Recruit;
import com.kh.almin.recruit.model.vo.ReportRecruit;
import com.kh.almin.recruit.model.vo.SearchRecruit;

@Service
public class RecruitServiceImpl implements RecruitService {
	private static final Logger logger = LoggerFactory.getLogger(RecruitServiceImpl.class);
	@Autowired
	private RecruitDao recruitDao;

	public List<Recruit> getReport() throws Exception {
		logger.info("Service 로깅 확인");
		return recruitDao.getReport();
	}

	public List<Recruit> recruitList() throws Exception {
		return recruitDao.recruitList();
	}

	public Recruit detailjobinfo(int recruitNo) throws Exception {
		return recruitDao.detailjobinfo(recruitNo);
	}

	public List<Recruit> searchRecruit(SearchRecruit searchRecruit) throws Exception {
		return recruitDao.searchRecruit(searchRecruit);
	}

	public int reportRecruit(int recruitNo) throws Exception {
		return recruitDao.reportRecruit(recruitNo);
	}

	public int likeRecruit(LikeRecruit likeRecruit) throws Exception {
		return recruitDao.likeRecruit(likeRecruit);
	}

	public int dislikeRecruit(LikeRecruit likeRecruit) throws Exception {
		return recruitDao.dislikeRecruit(likeRecruit);
	}

	public List<Recruit> listLike(String memberId) throws Exception {
		return recruitDao.listLike(memberId);
	}

	public int checkLike(LikeRecruit likeRecruit) throws Exception {
		return recruitDao.checkLike(likeRecruit);
	}

	public int doReport(ReportRecruit reportRecruit) throws Exception {
		return recruitDao.doReport(reportRecruit);
	}

	public int listReason(Reason reason) throws Exception {
		return recruitDao.listReason(reason);
	}

	public CountCat countCat() throws Exception {
		int count = 0;
		CountCat countCat = new CountCat();
		for (int recruitJobType = 0; recruitJobType < 13; recruitJobType++) {
			switch (recruitJobType) {
			case 8:
				count = recruitDao.countCat(recruitJobType);
				countCat.setCEight(count);
				break;
			case 11:
				count = recruitDao.countCat(recruitJobType);
				countCat.setCEleven(count);
				break;
			case 6:
				count = recruitDao.countCat(recruitJobType);
				countCat.setCSix(count);
				break;
			case 7:
				count = recruitDao.countCat(recruitJobType);
				countCat.setCSeven(count);
				break;
			case 4:
				count = recruitDao.countCat(recruitJobType);
				countCat.setCFour(count);
				break;
			case 9:
				count = recruitDao.countCat(recruitJobType);
				countCat.setCNine(count);
				break;
			case 10:
				count = recruitDao.countCat(recruitJobType);
				countCat.setCTen(count);
				break;
			case 12:
				count = recruitDao.countCat(recruitJobType);
				countCat.setCTwelve(count);
				break;
			}
		}
		return countCat;
	}

	public List<Recruit> appForYou(String memberId) throws Exception {
		return recruitDao.appForYou(memberId);
	}

	public int insertRecruit(Recruit r) throws Exception {
		return recruitDao.insertRecruit(r);
	}

	public int updateRecruit(Recruit r) throws Exception {
		return recruitDao.updateRecruit(r);
	}

	public int deleteRecruit(int recruitNo) throws Exception {
		return recruitDao.deleteRecruit(recruitNo);
	}

	public int checkReport(ReportRecruit reportRecruit) throws Exception {
		return recruitDao.checkReport(reportRecruit);
	}
}
