package com.social.dao;

import com.social.pojo.SpecialAuditMaterials;
import org.apache.ibatis.annotations.Param;

public interface SpecialAuditMaterialsMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(SpecialAuditMaterials record);

    int insertSelective(SpecialAuditMaterials record);

    SpecialAuditMaterials selectByRegistrationOfCasesId(Integer id);

    int updateByPrimaryKeySelective(SpecialAuditMaterials record);

    int updateByPrimaryKey(SpecialAuditMaterials record);
}