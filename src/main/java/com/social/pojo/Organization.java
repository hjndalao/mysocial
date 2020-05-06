package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Organization {
    private Integer id;

    private String departmentName;

    private Integer higherAuthoritiesId;

}