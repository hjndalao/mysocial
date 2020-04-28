package com.social.serviceImpl;

import com.social.dao.TerminationOfFilingFormMapper;
import com.social.pojo.TerminationOfFilingForm;
import com.social.service.TerminationOfFilingFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TerminationOfFilingFormServiceImpl implements TerminationOfFilingFormService {
    @Autowired
    private TerminationOfFilingFormMapper terminationOfFilingFormMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int status = terminationOfFilingFormMapper.deleteByPrimaryKey(id);
        return status;
    }

    @Override
    public int insert(TerminationOfFilingForm record) {
        int status = terminationOfFilingFormMapper.insert(record);
        return status;
    }

    @Override
    public int insertSelective(TerminationOfFilingForm record) {
        int status = terminationOfFilingFormMapper.insertSelective(record);
        return status;
    }
    @Transactional(propagation= Propagation.SUPPORTS,readOnly = true)
    @Override
    public TerminationOfFilingForm selectByPrimaryKey(Integer id) {
        TerminationOfFilingForm terminationOfFilingForm = terminationOfFilingFormMapper.selectByPrimaryKey(id);
        return terminationOfFilingForm;
    }

    @Override
    public int updateByRegistrationOfCasesId(TerminationOfFilingForm record) {
        int status = terminationOfFilingFormMapper.updateByRegistrationOfCasesId(record);
        return status;
    }

    @Override
    public int updateByPrimaryKey(TerminationOfFilingForm record) {
        int status = terminationOfFilingFormMapper.updateByPrimaryKey(record);
        return status;
    }
}
