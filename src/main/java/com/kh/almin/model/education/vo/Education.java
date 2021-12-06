package com.kh.almin.model.education.vo;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//EDUCATION_NO	NUMBER
//EDUCATION_TYPE	VARCHAR2(20 BYTE)
@Getter
@Setter
@ToString
@Data
@Component
public class Education {
	private int educationNo;
	private String educationType;
}
