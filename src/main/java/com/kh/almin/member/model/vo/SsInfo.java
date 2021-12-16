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
public class SsInfo {
	private String memberId;
	private String sessionType;//memberType, companyType 하나로 통일
	private String memberName;
	private String companyId;
	private String companyName;
}
