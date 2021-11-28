package com.kh.almin.career.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@NoArgsConstructor
@ToString
public class MemberNeed {
	
// NEED_MEMBER_NO 		NUMBER 			PRIMARY KEY,
// NEED_MEMBER_ID 		varchar2(50), 	-- 복합 외래키 지정(MEMBER)
// NEED_MEMBER_TYPE 	char(1) 		DEFAULT 1, -- 복합 외래키 지정(MEMBER)
// NEED_TITLE 			varchar2(50) 	NOT NULL,
// NEED_COLOR 			varchar2(10) 	DEFAULT '#0d6efd',
// NEED_TIME_START 		TIMESTAMP 		NOT NULL, -- 면접 혹은 지원 날짜(시작)
// NEED_TIME_END 		TIMESTAMP 		NOT NULL, -- 면접 혹은 지원 날짜(종료)
// NEED_GO_MEET 		char(1) 		CHECK(NEED_GO_MEET IN('G', 'M')), -- 면접인지 지원인지 구분
	
// CONSTRAINT MEMBER_NEED_MEMBER_FK FOREIGN KEY(NEED_MEMBER_ID, NEED_MEMBER_TYPE)REFERENCES MEMBER(MEMBER_ID, MEMBER_TYPE), -- 복합 외래키 지정(MEMBER)
// CONSTRAINT MEMBER_NEED_COMPANT_FK FOREIGN KEY(NEED_COMPANY_ID, NEED_COMPANY_TYPE)REFERENCES COMPANY(COMPANY_ID, COMPANY_TYPE) -- 복합 외래키 지정(COMPANY)

	private int needMemberNo;
	private String needMemberId;
	private String needMemberType;
	private String needTitle;
	private String needColor;
	private String needTimeStart;
	private String needTimeEnd;
	private String needGoMeet;
	
	public MemberNeed(String needMemberId, String needTitle, String needColor, String needTimeStart, String needTimeEnd, String needGoMeet) {

		super();
		this.needMemberId = needMemberId;
		this.needTitle = needTitle;
		this.needColor = needColor;
		this.needTimeStart = needTimeStart;
		this.needTimeEnd = needTimeEnd;
		this.needGoMeet = needGoMeet;
	}
}
