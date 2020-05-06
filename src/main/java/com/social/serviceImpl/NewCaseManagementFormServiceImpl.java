package com.social.serviceImpl;

import com.social.dao.NewCaseManagementFormMapper;
import com.social.pojo.NewCaseManagementForm;
import com.social.service.NewCaseManagementFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class NewCaseManagementFormServiceImpl implements NewCaseManagementFormService {
    @Autowired
    private NewCaseManagementFormMapper newCaseManagementForm;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int status = newCaseManagementForm.deleteByPrimaryKey(id);
        return status;
    }

    @Override
    public int insert(NewCaseManagementForm record) {
        int status = newCaseManagementForm.insert(record);
        return status;
    }

    @Override
    public int insertSelective(NewCaseManagementForm record) {
        int status = newCaseManagementForm.insertSelective(record);
        return status;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public NewCaseManagementForm selectByPrimaryKey(Integer id) {
        NewCaseManagementForm newCaseManagementForm = this.newCaseManagementForm.selectByPrimaryKey(id);
        return newCaseManagementForm;
    }

    @Override
    public List<NewCaseManagementForm> selectByRegistrationOfCasesId(Integer registrationOfCasesId) {
        List<NewCaseManagementForm> newCaseManagementForms = newCaseManagementForm.selectByRegistrationOfCasesId(registrationOfCasesId);
        return newCaseManagementForms;
    }

    @Override
    public int updateByPrimaryKeySelective(NewCaseManagementForm record) {
        int status = newCaseManagementForm.updateByPrimaryKeySelective(record);
        return status;
    }

    @Override
    public int updateByRegistrationOfCasesIdSelective(Integer registrationOfCasesId, String serviceTime) {
        int status = newCaseManagementForm.updateByRegistrationOfCasesIdSelective(registrationOfCasesId, serviceTime);
        return status;
    }

    @Override
    public int updateByPrimaryKey(NewCaseManagementForm record) {
        int status = newCaseManagementForm.updateByPrimaryKey(record);
        return status;
    }
}
