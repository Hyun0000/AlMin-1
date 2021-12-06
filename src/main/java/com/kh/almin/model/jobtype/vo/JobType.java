package com.kh.almin.model.jobtype.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;



import lombok.Data;
import lombok.Getter;
import lombok.Setter;

//JOB_TYPE_NO	NUMBER
//JOB_TYPE_NAME	VARCHAR2(50 BYTE)
@Getter
@Setter
@Data
@Component
public class JobType {
	private int jobTypeNo;
	private String jobTypeName;
}
