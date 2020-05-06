package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class NotificationCaseManagement {
    private Integer id;

    private Integer registrationOfCasesId;

    private Integer state;

    private String time;

}