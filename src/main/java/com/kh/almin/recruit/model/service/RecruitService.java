package com.kh.almin.recruit.model.service;

import java.util.List;

import com.kh.almin.recruit.model.vo.CountCat;
import com.kh.almin.recruit.model.vo.LikeRecruit;
import com.kh.almin.recruit.model.vo.Reason;
import com.kh.almin.recruit.model.vo.Recruit;
import com.kh.almin.recruit.model.vo.ReportRecruit;
import com.kh.almin.recruit.model.vo.SearchRecruit;

public interface RecruitService {
	public List<Recruit> getReport() throws Exception;

	public List<Recruit> recruitList() throws Exception;

	public Recruit detailjobinfo(int recruitNo) throws Exception;

	public List<Recruit> searchRecruit(SearchRecruit searchRecruit) throws Exception;

	public int reportRecruit(int recruitNo) throws Exception;

	public int likeRecruit(LikeRecruit likeRecruit) throws Exception;

	public int dislikeRecruit(LikeRecruit likeRecruit) throws Exception;

	public List<Recruit> listLike(String memberId) throws Exception;

	public int checkLike(LikeRecruit likeRecruit) throws Exception;

	public int doReport(ReportRecruit reportRecruit) throws Exception;

	public int listReason(Reason reason) throws Exception;

	public CountCat countCat() throws Exception;

	public List<Recruit> appForYou(String memberId) throws Exception;

	public int insertRecruit(Recruit r) throws Exception;
	
	public int updateRecruit(Recruit r) throws Exception;
	
	public int deleteRecruit(int recruitNo) throws Exception;
	
	public int checkReport(ReportRecruit reportRecruit) throws Exception;
	
	public List<Recruit> selectAllRecruit(Recruit r) throws Exception;
}
