package com.social.dao;

import com.social.pojo.AuditNcmForm;

public interface AuditNcmFormMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AuditNcmForm record);

    int insertSelective(AuditNcmForm record);

    AuditNcmForm selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AuditNcmForm record);

    int updateByPrimaryKey(AuditNcmForm record);
}