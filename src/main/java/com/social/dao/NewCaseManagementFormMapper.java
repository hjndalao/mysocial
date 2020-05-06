package com.social.dao;

import com.social.pojo.NewCaseManagementForm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewCaseManagementFormMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(NewCaseManagementForm record);

    int insertSelective(NewCaseManagementForm record);

    NewCaseManagementForm selectByPrimaryKey(Integer id);

    List<NewCaseManagementForm> selectByRegistrationOfCasesId(Integer registrationOfCasesId);

    int updateByPrimaryKeySelective(NewCaseManagementForm record);

    int updateByRegistrationOfCasesIdSelective(@Param("registrationOfCasesId") Integer registrationOfCasesId,@Param("serviceTime") String serviceTime);

    int updateByPrimaryKey(NewCaseManagementForm record);
}