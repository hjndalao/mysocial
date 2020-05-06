package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class WorkdayMaintenance {
    private Integer id;

    private String date;

    private Integer isWorkingDay;
}