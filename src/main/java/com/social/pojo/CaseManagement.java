package com.social.pojo;

public class CaseManagement {
    private Integer id;

    private Integer registrationOfCasesId;

    private Integer status;

    private String serviceTime;

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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(String serviceTime) {
        this.serviceTime = serviceTime == null ? null : serviceTime.trim();
    }
}