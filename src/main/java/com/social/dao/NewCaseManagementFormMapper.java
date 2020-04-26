package com.social.dao;

import com.social.pojo.NewCaseManagementForm;

public interface NewCaseManagementFormMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(NewCaseManagementForm record);

    int insertSelective(NewCaseManagementForm record);

    NewCaseManagementForm selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NewCaseManagementForm record);

    int updateByPrimaryKey(NewCaseManagementForm record);
}