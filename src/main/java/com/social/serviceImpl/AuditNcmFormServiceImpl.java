package com.social.serviceImpl;

import com.social.dao.AuditNcmFormMapper;
import com.social.pojo.AuditNcmForm;
import com.social.service.AuditNcmFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AuditNcmFormServiceImpl implements AuditNcmFormService {
    @Autowired
    private AuditNcmFormMapper auditNcmForm;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int status = auditNcmForm.deleteByPrimaryKey(id);
        return status;
    }

    @Override
    public int insert(AuditNcmForm record) {
        int status = auditNcmForm.insert(record);
        return status;
    }

    @Override
    public int insertSelective(AuditNcmForm record) {
        int status = auditNcmForm.insertSelective(record);
        return status;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public AuditNcmForm selectByPrimaryKey(Integer id) {
        AuditNcmForm auditNcmForm = this.auditNcmForm.selectByPrimaryKey(id);
        return auditNcmForm;
    }

    @Override
    public AuditNcmForm selectByRegistrationOfCasesId(Integer registrationOfCasesId) {
        AuditNcmForm auditNcmForm = this.auditNcmForm.selectByRegistrationOfCasesId(registrationOfCasesId);
        return auditNcmForm;
    }

    @Override
    public List<AuditNcmForm> selectAll() {
        List<AuditNcmForm> auditNcmForms = auditNcmForm.selectAll();
        return auditNcmForms;
    }

    @Override
    public int updateByPrimaryKeySelective(AuditNcmForm record) {
        int status = auditNcmForm.updateByPrimaryKeySelective(record);
        return status;
    }

    @Override
    public int updateByRegistrationOfCasesIdSelective(Integer registrationOfCasesId, Integer state,Integer baseOfPayment) {
        int status = auditNcmForm.updateByRegistrationOfCasesIdSelective(registrationOfCasesId, state,baseOfPayment);
        return status;
    }


    @Override
    public int updateByPrimaryKey(AuditNcmForm record) {
        int status = auditNcmForm.updateByPrimaryKey(record);
        return status;
    }
}