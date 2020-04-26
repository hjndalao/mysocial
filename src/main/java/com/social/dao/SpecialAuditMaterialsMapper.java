package com.social.dao;

import com.social.pojo.SpecialAuditMaterials;

public interface SpecialAuditMaterialsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SpecialAuditMaterials record);

    int insertSelective(SpecialAuditMaterials record);

    SpecialAuditMaterials selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SpecialAuditMaterials record);

    int updateByPrimaryKey(SpecialAuditMaterials record);
}