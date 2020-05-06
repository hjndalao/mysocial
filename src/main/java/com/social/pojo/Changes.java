package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Changes {
    private Integer id;

    private String changeOperator;

    private String operationContent;

}