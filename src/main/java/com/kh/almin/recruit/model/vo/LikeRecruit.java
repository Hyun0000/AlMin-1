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
public class LikeRecruit {
	private String memberId;
	private String memberType;
	private int recruitNo;

}
