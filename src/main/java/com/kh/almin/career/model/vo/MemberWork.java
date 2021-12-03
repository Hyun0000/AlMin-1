package com.kh.almin.career.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class MemberWork { // 회원 근무 테이블
// WORK_MEMBER_NO 		NUMBER 			PRIMARY KEY,
// WORK_MEMBER_ID 		varchar2(50), 	복합 외래키 지정(MEMBER)
// WORK_MEMBER_TYPE 	char(1) 		DEFAULT 1, 복합 외래키 지정(MEMBER)
// WORK_TITLE 			varchar2(50) 	NOT NULL,
// WORK_TIME 			NUMBER			NOT NULL, -- 근무 시간
// WORK_COLOR 			varchar2(10) 	DEFAULT '#0d6efd',
// WORK_TIME_START 		TIMESTAMP 		NOT NULL,
// WORK_TIME_END 		TIMESTAMP 		NOT NULL,
// WORK_MONEY 			NUMBER 			NOT NULL, -- 시급
// WORK_TYPE 			CHAR(1) 		CHECK(WORK_TYPE IN('W')), -- 면접인지 지원인지 구분

// CONSTRAINT MEMBER_WORK_MEMBER_FK FOREIGN KEY(WORK_MEMBER_ID, WORK_MEMBER_TYPE)REFERENCES MEMBER(MEMBER_ID, MEMBER_TYPE) -- 복합 외래키 지정(MEMBER)
	private int workMemberNo;
	private String workMemberId; 
	private String workMemberType;
	private String workTitle;
	private int workTime;
	private String workColor;
	private String workTimeStart;
	private String workTimeEnd;
	private int workMoney;
	private String workType;
}
