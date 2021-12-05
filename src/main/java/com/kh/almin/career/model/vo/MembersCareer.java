package com.kh.almin.career.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Data
@Component
public class MembersCareer { //회원 경력 테이블
//  CAREERS_NO 				NUMBER 			PRIMARY KEY,
//	CAREERS_MEMBER_ID 		varchar2(50), 	-- 복합 외래키 지정
//  CAREERS_MEMBER_TYPE 	char(1) 		DEFAULT 1, -- 복합 외래키 지정
//	CAREERS_TYPE 			NUMBER 			REFERENCES JOB_TYPE (JOB_TYPE_NO),
//	CAREERS_TIME 			NUMBER 			REFERENCES PERIOD(PERIOD_NO),
//	CAREERS_PART 			varchar2(100) 	NOT NULL,
//	
//  CONSTRAINT MEMBER_CAREER_FK FOREIGN KEY(CAREERS_MEMBER_ID, CAREERS_MEMBER_TYPE)REFERENCES MEMBER(MEMBER_ID, MEMBER_TYPE) -- 복합 외래키 지정
	
	private int careersNo;
	private String careersMemberId;
	private String careersMemberType;
	private int careersType; // 업종번호
	private int careersTime; // 근무기간번호
	private String careerPart; // 담당 업무(짧게)
}
