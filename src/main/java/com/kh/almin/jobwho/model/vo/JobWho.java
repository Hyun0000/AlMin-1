package com.kh.almin.jobwho.model.vo;

import org.springframework.stereotype.Component;

import com.kh.almin.district.model.vo.District;
import com.kh.almin.model.education.vo.Education;
import com.kh.almin.model.jobtype.vo.JobType;
import com.kh.almin.model.period.vo.Period;
import com.kh.almin.resume.model.vo.MemberResume;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//JOB_WHO_NO	NUMBER
//JOB_WHO_NAME	VARCHAR2(20 BYTE)
@Getter
@Setter
@ToString
@Data
@Component
public class JobWho {
	private int jobWhoNo;
	private String jobWhoName;
}
