package com.kh.almin.recruit.model.vo;


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
public class SearchRecruit {
	private int recruitJobType;
	private int recruitJobDistrict;
	private int recruitJobWho;
}
