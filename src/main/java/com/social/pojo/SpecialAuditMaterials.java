package com.social.pojo;

public class SpecialAuditMaterials {
    private Integer id;

    private Integer registrationOfCasesId;

    private String auditReportUrl;

    private Integer state;

    private String time;

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

    public String getAuditReportUrl() {
        return auditReportUrl;
    }

    public void setAuditReportUrl(String auditReportUrl) {
        this.auditReportUrl = auditReportUrl == null ? null : auditReportUrl.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }
}