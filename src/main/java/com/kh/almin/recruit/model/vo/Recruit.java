package com.kh.almin.recruit.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.kh.almin.district.model.vo.District;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Data
@Component
public class Recruit {
   private int recruitNo;
   private String recruitCompanyId;
   private char recruitCompanyType;
   private String recruitTitle;
   private String recruitCareer;
   private String recruitGender;
   private int recruitStartAge;
   private int recruitEndAge;
   private int recruitEducation;
   private int recruitPerson;
   private int recruitMoney;
   private int recruitPeriod;
   private String recruitDay;
   private String recruitTime;
   private String recruitAddress;
   private String recruitContent;
   private int recruitPhoto;
   private int recruitPolice;
   private int recruitJobType;
   private int recruitJobDistrict;
   private int recruitJobWho;
   private Date recruitDate;
   private char recruitPub;
   private char recruitJobBranch;
   private int recruitReport;
   
   private District district; //쿼리로 join할 Vo

@Override
public String toString() {
	String result = "Recruit [recruitNo=" + recruitNo + ", recruitCompanyId=" + recruitCompanyId + ", recruitCompanyType="
			+ recruitCompanyType + ", recruitTitle=" + recruitTitle + ", recruitCareer=" + recruitCareer
			+ ", recruitGender=" + recruitGender + ", recruitStartAge=" + recruitStartAge + ", recruitEndAge="
			+ recruitEndAge + ", recruitEducation=" + recruitEducation + ", recruitPerson=" + recruitPerson
			+ ", recruitMoney=" + recruitMoney + ", recruitPeriod=" + recruitPeriod + ", recruitDay=" + recruitDay
			+ ", recruitTime=" + recruitTime + ", recruitAddress=" + recruitAddress + ", recruitPhoto=" + recruitPhoto + ", recruitPolice=" + recruitPolice
			+ ", recruitJobType=" + recruitJobType + ", recruitJobDistrict=" + recruitJobDistrict + ", recruitJobWho="
			+ recruitJobWho + ", recruitDate=" + recruitDate + ", recruitPub=" + recruitPub + ", recruitJobBranch="
			+ recruitJobBranch + ", recruitReport=" + recruitReport + ", district=" + district;
	String content = recruitContent;
	if(recruitContent != null && recruitContent.length() > 20) {
		content = recruitContent.substring(0, 19);
	}
	result += ", recruitContent=" + content  + "]";
	return result;
}
   
   
}