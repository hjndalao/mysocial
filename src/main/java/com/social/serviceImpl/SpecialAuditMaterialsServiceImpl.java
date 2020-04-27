package com.social.serviceImpl;

import com.social.pojo.SpecialAuditMaterials;
import com.social.service.SpecialAuditMaterialsService;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public class SpecialAuditMaterialsServiceImpl implements SpecialAuditMaterialsService {

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(SpecialAuditMaterials record) {
        return 0;
    }

    @Override
    public int insertSelective(SpecialAuditMaterials record) {
        return 0;
    }
    @Transactional(propagation= Propagation.SUPPORTS,readOnly = true)
    @Override
    public SpecialAuditMaterials selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(SpecialAuditMaterials record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(SpecialAuditMaterials record) {
        return 0;
    }
}
