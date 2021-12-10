package com.kh.almin.member.model.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.almin.member.model.dao.MemberDao;
import com.kh.almin.member.model.vo.Company;
import com.kh.almin.member.model.vo.Member;

@Service
public class MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	@Autowired
	private MemberDao memberDao;
	
	public Member getMemberInfo(Member m) throws Exception{
		logger.info("Service 진입");
		Member member = memberDao.getMemberInfo(m);
		return member;
	}
	public Member updateMember(Member m) throws Exception{
		logger.info("Service 진입");
		int result = memberDao.updateMember(m);
		//수정된 정보를 화면에 뿌리기 위해 member를 한번 더 읽는다
		//업데이트엔 성공했지만 또 다른 접속자가 수정했을 가능성이 있으므로.
		Member member = memberDao.getMemberInfo(m);
		return member;
	}
	
	//개인회원가입
	public void insertMember(Member member) throws Exception{
		logger.info("MemberService-insertMember 진입");
		//만나이 적용안함 
		Date now = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
		String nowDate = simpleDateFormat.format(now); //현재년도
		
		if(member.getMemberBirth().startsWith("0")) {
			//2000년대 출생
			member.setMemberBirth("20"+member.getMemberBirth());
			
			String birth = member.getMemberBirth().substring(0,4);
			int memberAge = Integer.parseInt(nowDate) - Integer.parseInt(birth)+1;//태어나면 1살이니까 +1
			member.setMemberAge(memberAge);
			System.out.println("nowDate: "+nowDate+"memberAge: "+memberAge+"birth: "+birth);
			
		} else {
			//1900년대
			member.setMemberBirth("19"+member.getMemberBirth());
			
			String birth = member.getMemberBirth().substring(0,4);
			int memberAge = Integer.parseInt(nowDate) - Integer.parseInt(birth)+1;
			member.setMemberAge(memberAge);
			System.out.println("nowDate: "+nowDate+"memberAge: "+memberAge+"birth: "+birth);
		}
		if(member.getMemberGender().equals("1")||member.getMemberGender().equals("3"))//1,3
			member.setMemberGender("M");
		else if(member.getMemberGender().equals("2")||member.getMemberGender().equals("4")) {
			member.setMemberGender("F");//TODO: GenderException으로 커스터마이징 할수있다.
		}
		
			//0n으로 시작하면 2000년대
		//1900년대 / 2000년대 출생 구분
		memberDao.insertMember(member);
	}
	public void insertCompany(Company company) throws Exception{
		logger.info("MemberService-insertCompany 진입");
		memberDao.insertCompany(company);
	}
	public int idChk(Member member) throws Exception{
		logger.info("개인회원 아이디 중복체크 진입");
		Integer result = memberDao.idChk(member);
		return result;
	}
	public Member selectMember(Member member) throws Exception{
		logger.info("개인회원 로그인-아디비번 동시체크 진입");
		Member result = memberDao.selectMember(member);
		return result;
	}
	public Company loginCompany(Company company) throws Exception{
		logger.info("개인회원 로그인-아디비번 동시체크 진입");
		Company result = memberDao.loginCompany(company);
		return result;
	}
	public Member findMIdphone(Member member) throws Exception{
		logger.info("개인회원-아이디찾기(연락처) 진입");
		Member result = memberDao.findMIdphone(member);
		return result;
	}
	public Member findMIdmail(Member member) throws Exception{
		logger.info("개인회원-아이디찾기(이메일) 진입");
		Member result = memberDao.findMIdmail(member);
		return result;
	}
	public Company findCIdphone(Company company) throws Exception{
		logger.info("기업회원-아이디찾기(연락처) 진입");
		Company result = memberDao.findCIdphone(company);
		return result;
	}
	public Company findCIdmail(Company company) throws Exception{
		logger.info("기업회원-아이디찾기(이메일) 진입");
		Company result = memberDao.findCIdmail(company);
		return result;
	}
	public Company findCIdnum(Company company) throws Exception{
		logger.info("기업회원-아이디찾기(사업자번호) 진입");
		Company result = memberDao.findCIdnum(company);
		return result;
	}

	public int findMPWdphone(Member member) {
		logger.info("개인 비번찾기(연락처) 진입");
		int result = memberDao.findMPWdphone(member);
		return result;
	}
}
