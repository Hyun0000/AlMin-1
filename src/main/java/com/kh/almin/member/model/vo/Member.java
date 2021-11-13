package com.kh.almin.member.model.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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
