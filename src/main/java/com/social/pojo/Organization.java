package com.social.pojo;

public class Organization {
    private Integer id;

    private String departmentName;

    private Integer higherAuthoritiesId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName == null ? null : departmentName.trim();
    }

    public Integer getHigherAuthoritiesId() {
        return higherAuthoritiesId;
    }

    public void setHigherAuthoritiesId(Integer higherAuthoritiesId) {
        this.higherAuthoritiesId = higherAuthoritiesId;
    }
}