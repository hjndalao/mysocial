package com.social.dao;

import com.social.pojo.AuditNcmForm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuditNcmFormMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AuditNcmForm record);

    int insertSelective(AuditNcmForm record);

    AuditNcmForm selectByPrimaryKey(Integer id);

    int updateByRegistrationOfCasesIdSelective(@Param("registrationOfCasesId") Integer registrationOfCasesId, @Param("state") Integer state, @Param("baseOfPayment") Integer baseOfPayment);

    AuditNcmForm selectByRegistrationOfCasesId(Integer registrationOfCasesId);

    List<AuditNcmForm> selectAll();

    int updateByPrimaryKeySelective(AuditNcmForm record);

    int updateByPrimaryKey(AuditNcmForm record);
}