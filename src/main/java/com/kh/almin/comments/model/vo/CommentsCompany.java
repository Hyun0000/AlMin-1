package com.kh.almin.comments.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
@Component
public class CommentsCompany {
	private int ccNo;
	private int ccRecruitNo;
	private String ccWriter;
	private String ccWriterType;
	private String ccContent;
	private String ccDate;
	private String ccContract;
	
	// 후기 insert용 생성자(추후 수정 가능성 있음)
	public CommentsCompany(int ccRecruitNo, String ccWriter, String ccContent, String ccContract) {
		this.ccRecruitNo = ccRecruitNo;
		this.ccWriter = ccWriter;
		this.ccContent = ccContent;
		this.ccContract = ccContract;
	}
}
//CC_NO 			NUMBER 				PRIMARY KEY, -- 시퀀스 사용
//CC_RECRUIT_NO 	NUMBER 				REFERENCES COMPANY_RECRUIT(RECRUIT_NO),
//CC_WRITER 		varchar2(50), 		-- 복합 외래키 지정(MEMBER)
//CC_WRITER_TYPE 	char(1) 			DEFAULT 1,-- 복합 외래키 지정(MEMBER)
//CC_CONTENT 		varchar2(1000) 		NOT NULL,
//CC_DATE			timestamp 			DEFAULT sysdate,
//CC_CONTRACT		char(1) 			CHECK(CC_CONTRACT IN ('Y', 'N')),

//FOREIGN KEY(CC_WRITER, CC_WRITER_TYPE)REFERENCES MEMBER(MEMBER_ID, MEMBER_TYPE) -- 복합 외래키 지정(MEMBER)