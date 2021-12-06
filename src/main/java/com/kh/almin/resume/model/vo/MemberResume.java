package com.kh.almin.resume.model.vo;

import org.springframework.stereotype.Component;

import com.kh.almin.district.model.vo.District;
import com.kh.almin.model.education.vo.Education;
import com.kh.almin.model.jobtype.vo.JobType;
import com.kh.almin.model.period.vo.Period;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
//RESUME_NO        NOT NULL NUMBER         
//MEMBER_ID                 VARCHAR2(50)   
//MEMBER_TYPE               CHAR(1)        
//RESUME_TITLE     NOT NULL VARCHAR2(200)  
//RESUME_PUBLIC_YN NOT NULL CHAR(1)        
//RESUME_PHONE     NOT NULL VARCHAR2(20)   
//JOB_DISTRICT_NO           NUMBER         
//EDUCATION_NO              NUMBER         
//CAREERS_NO                NUMBER         
//JOB_CAREERS               VARCHAR2(3000) 
//PERIOD_NO                 NUMBER      
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
	private String resumePhone;
	private int jobDistrictNo;
	private int educationNo;
	private int careersNo;
	private String jobCareers;
	private int periodNo;
	private int jobTypeNo;
	private byte[] resumePhoto;
	
	//join
	private District district;
	private JobType jobType;
	private Education education;
	private Period period;
}
