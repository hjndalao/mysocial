package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class RegistrationOfCases {
    private Integer id;

    private String unitName;

    private String organizationalCode;

    private String nameOfTheComplainant;

    private String idCard;

    private String phone;

    private Integer accountCharacter;

    private Integer age;

    private Integer sex;

    private String complaintContents;

    private String nameOfRegistrant;

    private String registrationTime;

    private String nameOfTheFiler;

    private Integer filingMonth;

    private String filingTime;

    private Integer approvalStatus;

    private Integer warningTime;

    private Integer numberOfAuditors;

    private Integer auditHouseholds;

    private Float amountPaid;

    private Integer typeStatus;

    private Integer maxtime;
}