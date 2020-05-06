package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserPostKey {
    private Integer userId;

    private Integer postId;

}