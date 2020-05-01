package com.social.serviceImpl;

import com.social.dao.SpecialAuditMaterialsMapper;
import com.social.pojo.SpecialAuditMaterials;
import com.social.service.SpecialAuditMaterialsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class SpecialAuditMaterialsServiceImpl implements SpecialAuditMaterialsService {
    @Autowired
    @Resource
    SpecialAuditMaterialsMapper specialAuditMaterialsMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int status = specialAuditMaterialsMapper.deleteByPrimaryKey(id);
        return status;
    }

    @Override
    public int insert(SpecialAuditMaterials record) {
        int status = specialAuditMaterialsMapper.insert(record);
        return status;
    }

    @Override
    public int insertSelective(SpecialAuditMaterials record) {
        int status = specialAuditMaterialsMapper.insertSelective(record);
        return status;
    }

    @Override
    public SpecialAuditMaterials selectByRegistrationOfCasesId(Integer id) {
        return specialAuditMaterialsMapper.selectByRegistrationOfCasesId(id);
    }


    @Override
    public int updateByPrimaryKeySelective(SpecialAuditMaterials record) {
        int status = specialAuditMaterialsMapper.updateByPrimaryKeySelective(record);
        return status;
    }

    @Override
    public int updateByregiStrationOfCasesId(SpecialAuditMaterials record) {
        int status = specialAuditMaterialsMapper.updateByregiStrationOfCasesId(record);
        return status;
    }
}
