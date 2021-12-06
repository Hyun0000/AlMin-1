package com.kh.almin.model.period.vo;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//PERIOD_NO	NUMBER
//PERIOD_TYPE	VARCHAR2(20 BYTE)
@Getter
@Setter
@ToString
@Data
@Component
public class Period {
	private int periodNo;
	private String periodType;
}
