package com.social.service;

import com.social.pojo.SpecialAuditMaterials;

public interface SpecialAuditMaterialsService {

    int deleteByPrimaryKey(Integer id);

    int insert(SpecialAuditMaterials record);

    int insertSelective(SpecialAuditMaterials record);

    SpecialAuditMaterials selectByRegistrationOfCasesId(Integer id);

    int updateByPrimaryKeySelective(SpecialAuditMaterials record);

    int updateByPrimaryKey(SpecialAuditMaterials record);
}
