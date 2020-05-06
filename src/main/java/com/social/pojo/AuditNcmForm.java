package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class AuditNcmForm {
    private Integer id;

    private Integer registrationOfCasesId;

    private String applicationMaterialsUrl;

    private String record;

    private Integer state;

    private Integer baseOfPayment;

    private String time;
}