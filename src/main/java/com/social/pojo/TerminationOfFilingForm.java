package com.social.pojo;

import lombok.*;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TerminationOfFilingForm {
    private Integer id;

    private Integer registrationOfCasesId;

    private String causeOfAction;

    private String reasonsForTermination;

    private String investigatorViews;

    private String responsibleOpinions;
}