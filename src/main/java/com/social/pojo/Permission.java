package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Permission {
    private Integer id;

    private String permissionName;

    private String url;

}