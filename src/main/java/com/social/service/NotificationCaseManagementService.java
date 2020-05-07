package com.social.service;

import com.social.pojo.NotificationCaseManagement;

public interface NotificationCaseManagementService {

    int deleteByPrimaryKey(Integer id);

    int insert(NotificationCaseManagement record);

    int insertSelective(NotificationCaseManagement record);

    NotificationCaseManagement selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NotificationCaseManagement record);

    int updateByRegistrationOfCasesId(NotificationCaseManagement record);

    int updateByPrimaryKey(NotificationCaseManagement record);
}
