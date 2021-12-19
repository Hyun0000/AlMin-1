package com.kh.almin.myrecruit.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
@Component
public class MyRecruit {
//	RWM_RECRUIT_NO 		NUMBER 				REFERENCES COMPANY_RECRUIT(RECRUIT_NO),
//	RWM_MEMBER_ID 		VARCHAR2(50), 		복합 외래키 지정(MEMBER)
//	RWM_MEMBER_TYPE		CHAR(1) 			DEFAULT 1, 복합 외래키 지정(MEMBER)
	
//  CONSTRAINT RECURUIT_WANT_MEMBER_FK FOREIGN KEY(RWM_MEMBER_ID, RWM_MEMBER_TYPE)REFERENCES MEMBER(MEMBER_ID, MEMBER_TYPE)  on delete cascade 복합 외래키 지정(MEMBER)
    private int rwmRecruitNo;
    private String rwmMemberId;
    private String rwmMemberType;
    private int rwmMemberResumeNo;
}