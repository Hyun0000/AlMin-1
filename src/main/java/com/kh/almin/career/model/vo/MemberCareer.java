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
public class MemberCareer { //회원 경력 테이블
	private String memberId;
	private String memberType;
	private String jobTypeNo; //업종번호
	private String periodNo; //근무기간번호
	private String careerPart;
	
}
