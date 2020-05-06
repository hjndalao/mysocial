package com.social.service;

import com.social.pojo.CaseManagement;

public interface CaseManagementService {

    int deleteByPrimaryKey(Integer id);

    int insert(CaseManagement record);

    int insertSelective(CaseManagement record);

    CaseManagement selectByPrimaryKey(Integer id);

    CaseManagement selectByRegistrationOfCasesId(Integer id);

    int updateByRegistrationOfCasesId(CaseManagement record);

    int updateByPrimaryKeySelective(CaseManagement record);

    int updateByPrimaryKey(CaseManagement record);
}
