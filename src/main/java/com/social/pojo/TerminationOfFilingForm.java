package com.social.pojo;

public class TerminationOfFilingForm {
    private Integer id;

    private Integer registrationOfCasesId;

    private String causeOfAction;

    private String reasonsForTermination;

    private String investigatorViews;

    private String responsibleOpinions;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRegistrationOfCasesId() {
        return registrationOfCasesId;
    }

    public void setRegistrationOfCasesId(Integer registrationOfCasesId) {
        this.registrationOfCasesId = registrationOfCasesId;
    }

    public String getCauseOfAction() {
        return causeOfAction;
    }

    public void setCauseOfAction(String causeOfAction) {
        this.causeOfAction = causeOfAction == null ? null : causeOfAction.trim();
    }

    public String getReasonsForTermination() {
        return reasonsForTermination;
    }

    public void setReasonsForTermination(String reasonsForTermination) {
        this.reasonsForTermination = reasonsForTermination == null ? null : reasonsForTermination.trim();
    }

    public String getInvestigatorViews() {
        return investigatorViews;
    }

    public void setInvestigatorViews(String investigatorViews) {
        this.investigatorViews = investigatorViews == null ? null : investigatorViews.trim();
    }

    public String getResponsibleOpinions() {
        return responsibleOpinions;
    }

    public void setResponsibleOpinions(String responsibleOpinions) {
        this.responsibleOpinions = responsibleOpinions == null ? null : responsibleOpinions.trim();
    }
}