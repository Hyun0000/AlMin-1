package com.kh.almin.applicant.model.vo;

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
public class Applicant {
	private int resumeNo;
	private String memberId;
	private String memberType;
	private String resumeTitle;
	private String resumeContent;
	private int educationNo;
}
