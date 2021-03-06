package com.social.dao;

import com.social.pojo.CaseManagement;

public interface CaseManagementMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CaseManagement record);

    int insertSelective(CaseManagement record);

    CaseManagement selectByPrimaryKey(Integer id);

    CaseManagement selectByRegistrationOfCasesId(Integer id);

    int updateByPrimaryKeySelective(CaseManagement record);

    int updateByRegistrationOfCasesId(CaseManagement record);

    int updateByPrimaryKey(CaseManagement record);
}