package com.social.pojo;

public class AuditNcmForm {
    private Integer id;

    private Integer registrationOfCasesId;

    private String applicationMaterialsUrl;

    private String record;

    private Integer state;

    private Integer baseOfPayment;

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

    public String getApplicationMaterialsUrl() {
        return applicationMaterialsUrl;
    }

    public void setApplicationMaterialsUrl(String applicationMaterialsUrl) {
        this.applicationMaterialsUrl = applicationMaterialsUrl == null ? null : applicationMaterialsUrl.trim();
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record == null ? null : record.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getBaseOfPayment() {
        return baseOfPayment;
    }

    public void setBaseOfPayment(Integer baseOfPayment) {
        this.baseOfPayment = baseOfPayment;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }
}