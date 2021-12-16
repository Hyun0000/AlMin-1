package com.kh.almin.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;

@Repository
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	@Autowired
//	@Qualifier("sqlSession")
	private SqlSession sqlSession;//root-context에 정의한 bean 이름과 일치하게 쓰는것을 강력추천.(다르게 쓰면 동작안할 확률 있음)

	public Member getMemberInfo(Member m) throws Exception {
		Member member = sqlSession.selectOne("Member.listMember", m);
		logger.info("Dao-getMemberInfo 진입");
		return member;
	}

	public void insertMember(Member member) throws Exception{
		logger.info("Dao-insertMember 진입");
		sqlSession.insert("Member.insertMember", member);
	}
	
	public void insertCompany(Company company) throws Exception{
		logger.info("Dao-insertCompany 진입");
		sqlSession.insert("Member.insertCompany", company);
	}
	
	// 개인회원 로그인 - id, pw 동시체크
	public Member selectMember(Member member) throws Exception{
		logger.info("Dao-selectMember 진입");
		Member result = sqlSession.selectOne("Member.loginMember", member.getMemberId());
		logger.info("id: "+member.getMemberId()+" result: "+result);
		return result;
	}
	// 기업회원 로그인 - id, pw 동시체크
	public Company loginCompany(Company company) throws Exception{
		logger.info("Dao-selectCompany 진입");
		Company result = sqlSession.selectOne("Member.loginCompany", company.getCompanyId());
		logger.info("id: "+company.getCompanyId()+" result: "+result);
		return result;
	}
	
	//개인회원정보 수정
	public int updateMember(Member m) throws Exception{
		logger.info("Dao-updateMember 진입");
		int result = sqlSession.update("Member.updateMember",m);
		return result;
	}
	//개인 비번찾기 - 재설정
	public void updatePwMember(Member m) {
		logger.info("Dao-updatePwMember 진입");
		sqlSession.update("Member.updatePwMember",m);
	}
	//기업 비번찾기 - 재설정
	public int updatePwCompany(Member m) {
		logger.info("Dao-updatePwCompany 진입");
		int result = sqlSession.update("Member.updatePwCompany",m);
		return result;
	}
	//개인회원 ID 중복체크
	public int idChk(Member member) throws Exception{
		logger.info("Dao-idChk 진입");
		Integer result = sqlSession.selectOne("Member.idChk", member.getMemberId());
		logger.info("id: "+member.getMemberId()+" result: "+result);
		// 입력된 아이디가 DB에 존재시 1 없으면 0
		return result;
	}
	//개인회원 ID 중복체크
	public int idChkCompany(Company company) throws Exception{
		logger.info("Dao-idChk 진입");
		Integer result = sqlSession.selectOne("Member.idChkCompany", company.getCompanyId());
		logger.info("id: "+company.getCompanyId()+" result: "+result);
		// 입력된 아이디가 DB에 존재시 1 없으면 0
		return result;
	}
	
	// 개인회원 아이디 찾기(연락처)
	public Member findMIdphone(Member member) throws Exception{
		logger.info("Dao-findMIdphone 진입");
		Member result = sqlSession.selectOne("Member.findMIdphone", member);
		logger.info("id: "+result.getMemberId()+" result: "+result);
		return result;
	}
	// 개인회원 아이디 찾기(이메일)
	public Member findMIdmail(Member member) throws Exception{
		logger.info("Dao-findMIdmail 진입");
		Member result = sqlSession.selectOne("Member.findMIdmail", member);
		logger.info("id: "+result.getMemberId()+" result: "+result);
		return result;
	}
	
	// 기업회원 아이디 찾기(연락처)
		public Company findCIdphone(Company company) throws Exception{
			logger.info("Dao-findCIdphone 진입");
			Company result = sqlSession.selectOne("Member.findCIdphone", company);
			logger.info("id: "+result.getCompanyId()+" result: "+result);
			return result;
		}
	// 기업회원 아이디 찾기(이메일)
		public Company findCIdmail(Company company) throws Exception{
			logger.info("Dao-findCIdmail 진입");
			Company result = sqlSession.selectOne("Member.findCIdmail", company);
			logger.info("id: "+result.getCompanyId()+" result: "+result);
			return result;
		}
	// 기업회원 아이디 찾기(사업자번호)
		public Company findCIdnum(Company company) throws Exception{
			logger.info("Dao-findCIdnum 진입");
			Company result = sqlSession.selectOne("Member.findCIdnum", company);
			logger.info("id: "+result.getCompanyId()+" result: "+result);
			return result;
		}

		public int findMPWdphone(Member member) {
			logger.info("Dao-findMPWdphone 진입");
			int result = sqlSession.selectOne("Member.findMPWdphone", member);
			return result;
		}
}
