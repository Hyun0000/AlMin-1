package com.kh.almin.applicant.model.vo;

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
public class LikeApplicant {
	private int resumeNo;
	private String companyId;
	private String companyType;
}
