package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class SpecialAuditMaterials {
    private Integer id;

    private Integer registrationOfCasesId;

    private String auditReportUrl;

    private Integer state;

    private String time;
}