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
public class SearchApplicant {
	private int jobDistrictNo;
	private int educationNo;
	private int careersNo;
	private String memberGender;
}
