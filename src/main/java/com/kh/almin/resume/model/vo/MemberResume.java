package com.kh.almin.resume.model.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Data
public class MemberResume { //회원 이력서 테이블
	private int resumeNo;
	private String memberId;
	private String memberType;
	private int resumePhotoNo;
	private int educationNo;
	private String resumeTitle;
	private String resumeContent;
}
