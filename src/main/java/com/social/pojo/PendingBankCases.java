package com.social.pojo;

public class PendingBankCases {
    private Integer id;

    private Integer registrationOfCasesId;

    private String pdTime;

    private Integer state;

    private Integer haveMoney;

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

    public String getPdTime() {
        return pdTime;
    }

    public void setPdTime(String pdTime) {
        this.pdTime = pdTime == null ? null : pdTime.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getHaveMoney() {
        return haveMoney;
    }

    public void setHaveMoney(Integer haveMoney) {
        this.haveMoney = haveMoney;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }
}