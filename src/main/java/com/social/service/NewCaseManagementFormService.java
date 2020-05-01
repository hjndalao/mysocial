package com.social.service;

import com.social.pojo.NewCaseManagementForm;

public interface NewCaseManagementFormService {
    int deleteByPrimaryKey(Integer id);

    int insert(NewCaseManagementForm record);

    int insertSelective(NewCaseManagementForm record);

    NewCaseManagementForm selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NewCaseManagementForm record);

    int updateByPrimaryKey(NewCaseManagementForm record);
}