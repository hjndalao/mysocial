package com.social.service;

import com.social.pojo.AuditNcmForm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuditNcmFormService {

    int deleteByPrimaryKey(Integer id);

    int insert(AuditNcmForm record);

    int insertSelective(AuditNcmForm record);

    AuditNcmForm selectByPrimaryKey(Integer id);

    AuditNcmForm  selectByRegistrationOfCasesId(Integer registrationOfCasesId);

    List<AuditNcmForm> selectAll();

    int updateByPrimaryKeySelective(AuditNcmForm record);

    int updateByRegistrationOfCasesIdSelective(Integer registrationOfCasesId, Integer state,Integer baseOfPayment);

    int updateByPrimaryKey(AuditNcmForm record);
}