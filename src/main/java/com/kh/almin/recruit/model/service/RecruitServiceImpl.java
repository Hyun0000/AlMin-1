package com.kh.almin.recruit.model.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.recruit.model.dao.RecruitDao;
import com.kh.almin.recruit.model.vo.Recruit;

@Service
public class RecruitServiceImpl implements RecruitService {
	private static final Logger logger = LoggerFactory.getLogger(RecruitServiceImpl.class);
	@Autowired
	private RecruitDao recruitDao;

	public List<Recruit> getReport() throws Exception {
		logger.info("Service 로깅 확인");
		List<Recruit> recruits = recruitDao.getReport();
		return recruits;
	}
	public List<Recruit> recruitList() throws Exception{
		List<Recruit> recruit=new ArrayList<Recruit>();
		recruit=recruitDao.recruitList();
		return recruit;
	}
	public List<Recruit> detailjobinfo() throws Exception{
		List<Recruit> recruit=new ArrayList<Recruit>();
		recruit=recruitDao.detailjobinfo();
		return recruit;
	}
}
