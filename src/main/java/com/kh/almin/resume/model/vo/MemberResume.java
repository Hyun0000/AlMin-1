package com.kh.almin.resume.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
//RESUME_NO	NUMBER
//MEMBER_ID	VARCHAR2(50 BYTE)
//MEMBER_TYPE	CHAR(1 BYTE)
//RESUME_TITLE	VARCHAR2(200 BYTE)
//RESUME_PUBLIC_YN	CHAR(1 BYTE)
//RESUME_PHONE	CHAR(13 BYTE)
//JOB_DISTRICT_NO	NUMBER
//EDUCATION_NO	NUMBER
//CAREERS_NO	NUMBER
//JOB_CAREERS VARCHAR2(3000)
@Getter
@Setter
@ToString
@Data
@Component
public class MemberResume { //회원 이력서 테이블
	private int resumeNo;
	private String memberId;
	private char memberType;
	private String resumeTitle;
	private char resumePublicYn;
	private char resumePhone;
	private int jobDistrictNo;
	private int educationNo;
	private int careersNo;
	private String jobCareers;
}
