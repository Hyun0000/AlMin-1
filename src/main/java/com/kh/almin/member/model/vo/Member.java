package com.kh.almin.member.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Data
@Component
public class Member {
	
	private String memberId;
	private String memberType;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberAddress;
	private String memberBirth;
	private String memberEmail;
	private String memberGender;
	private int memberAge;
	private String memberRegdate;

}
