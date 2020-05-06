package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Post {
    private Integer id;

    private String postName;

    private Integer state;
}