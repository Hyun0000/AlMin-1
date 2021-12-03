package com.kh.almin.recruit.model.vo;

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
public class Reason {
	private int recruitNo;
	private int reasonNo;
	private int count;
}
