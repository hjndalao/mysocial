package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CaseManagement {

    private Integer id;

    private Integer registrationOfCasesId;

    private Integer status;

    private String serviceTime;
}