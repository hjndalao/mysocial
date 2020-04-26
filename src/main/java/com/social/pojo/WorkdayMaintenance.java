package com.social.pojo;

public class WorkdayMaintenance {
    private Integer id;

    private String date;

    private Integer isWorkingDay;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

    public Integer getIsWorkingDay() {
        return isWorkingDay;
    }

    public void setIsWorkingDay(Integer isWorkingDay) {
        this.isWorkingDay = isWorkingDay;
    }
}