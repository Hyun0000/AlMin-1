package com.kh.almin.district.model.vo;

//JOB_DISTRICT_NO
//JOB_DISTRICT_NAME
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
public class District {
	private int jobDistrictNo;
	private String jobDistrictName;
}
