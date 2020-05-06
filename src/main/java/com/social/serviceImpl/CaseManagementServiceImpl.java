package com.social.serviceImpl;

import com.social.dao.CaseManagementMapper;
import com.social.pojo.CaseManagement;
import com.social.service.CaseManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CaseManagementServiceImpl implements CaseManagementService {
    @Autowired
    private CaseManagementMapper caseManagement;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int status = caseManagement.deleteByPrimaryKey(id);
        return status;
    }

    @Override
    public int insert(CaseManagement record) {
        int status = caseManagement.insert(record);
        return status;
    }

    @Override
    public int insertSelective(CaseManagement record) {
        int status = caseManagement.insertSelective(record);
        return status;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public CaseManagement selectByPrimaryKey(Integer id) {
        CaseManagement caseManagement = this.caseManagement.selectByPrimaryKey(id);
        return caseManagement;
    }

    @Override
    public CaseManagement selectByRegistrationOfCasesId(Integer id) {
        CaseManagement caseManagement = this.caseManagement.selectByRegistrationOfCasesId(id);
        return caseManagement;
    }

    @Override
    public int updateByRegistrationOfCasesId(CaseManagement record) {
        int status = caseManagement.updateByRegistrationOfCasesId(record);
        return status;
    }

    @Override
    public int updateByPrimaryKeySelective(CaseManagement record) {
        int status = caseManagement.updateByPrimaryKeySelective(record);
        return status;
    }

    @Override
    public int updateByPrimaryKey(CaseManagement record) {
        int status = caseManagement.updateByPrimaryKey(record);
        return status;
    }
}
