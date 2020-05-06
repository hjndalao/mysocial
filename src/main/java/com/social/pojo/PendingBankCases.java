package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class PendingBankCases {
    private Integer id;

    private Integer registrationOfCasesId;

    private String pdTime;

    private Integer state;

    private Integer haveMoney;

    private String time;

}