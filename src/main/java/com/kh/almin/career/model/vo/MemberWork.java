package com.kh.almin.career.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Component
public class MemberWork { // 회원 근무 테이블
	// WORK_MEMBER_ID 		varchar2(50), 		-- 복합 외래키 지정(MEMBER)
	// WORK_MEMBER_TYPE 	char(1) 			DEFAULT 1, -- 복합 외래키 지정(MEMBER)
	// WORK_COMPANY_ID 		varchar2(50), 		-- 복합 외래키 지정(COMPANY)
	// WORK_COMPANY_TYPE 	char(1) 			DEFAULT 2, 	-- 복합 외래키 지정(COMPANY)
	// WORK_TYPE 			NUMBER 				REFERENCES JOB_TYPE (JOB_TYPE_NO),
	// WORK_DAY 			NUMBER				DEFAULT 0,
	// WORK_MONEY 			NUMBER 				NOT NULL,
	// FOREIGN KEY(WORK_MEMBER_ID, WORK_MEMBER_TYPE)REFERENCES MEMBER(MEMBER_ID, MEMBER_TYPE), -- 복합 외래키 지정(MEMBER)
	// FOREIGN KEY(WORK_COMPANY_ID, WORK_COMPANY_TYPE)REFERENCES COMPANY(COMPANY_ID, COMPANY_TYPE) -- 복합 외래키 지정(COMPANY)
		private String workMemberId; 
		private String workMemberType;
		private String workCompanyId;
		private String workCompanyType;
		private int workType;
		private int workDay;
		private int workMoney;
}
