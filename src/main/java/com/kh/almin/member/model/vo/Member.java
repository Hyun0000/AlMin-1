package com.kh.almin.member.model.vo;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

//개인회원 테이블
@Getter
@Setter
@Data
public class Member {
	
	private String memberId;
	private String memberType;
	private String memberName;
	private String memberPhone;
	private String memberAddress;
	private String memberbirth;
	private String memberEmail;
	private String memberGender;
	private int memberAge;
	private String memberRegdate;

	

}
