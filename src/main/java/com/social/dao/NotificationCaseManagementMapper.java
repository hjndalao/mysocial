package com.social.dao;

import com.social.pojo.NotificationCaseManagement;

public interface NotificationCaseManagementMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(NotificationCaseManagement record);

    int insertSelective(NotificationCaseManagement record);

    NotificationCaseManagement selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NotificationCaseManagement record);

    int updateByPrimaryKey(NotificationCaseManagement record);
}