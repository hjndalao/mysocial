package com.social.service;

import com.social.pojo.NewCaseManagementForm;

import java.util.List;

public interface NewCaseManagementFormService {
    int deleteByPrimaryKey(Integer id);

    int insert(NewCaseManagementForm record);

    int insertSelective(NewCaseManagementForm record);

    NewCaseManagementForm selectByPrimaryKey(Integer id);

    List<NewCaseManagementForm> selectByRegistrationOfCasesId(Integer registrationOfCasesId);

    int updateByPrimaryKeySelective(NewCaseManagementForm record);

    int updateByRegistrationOfCasesIdSelective(Integer registrationOfCasesId, String serviceTime);

    int updateByPrimaryKey(NewCaseManagementForm record);
}