package com.kh.almin.recruit.model.vo;

import java.sql.Date;

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
public class Recruit {
   private int recruitNo;
   private String recruitCompanyId;
   private char recruitCompanyType;
   private String recruitTitle;
   private String recruitCareer;
   private String recruitGender;
   private int recruitAge;
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
}