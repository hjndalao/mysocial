package com.social.serviceImpl;

import com.social.dao.PendingBankCasesMapper;
import com.social.pojo.PendingBankCases;
import com.social.service.PendingBankCasesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class PendingBankCasesServiceImpl implements PendingBankCasesService {
    @Autowired
    private PendingBankCasesMapper pendingBankCases;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int status = pendingBankCases.deleteByPrimaryKey(id);
        return status;
    }

    @Override
    public int insert(PendingBankCases record) {
        int status = pendingBankCases.insert(record);
        return status;
    }

    @Override
    public int insertSelective(PendingBankCases record) {
        int status = pendingBankCases.insertSelective(record);
        return status;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public PendingBankCases selectByPrimaryKey(Integer id) {
        PendingBankCases pendingBankCases = this.pendingBankCases.selectByPrimaryKey(id);
        return pendingBankCases;
    }

    @Override
    public List<PendingBankCases> selectAll() {
        List<PendingBankCases> pendingBankCases = this.pendingBankCases.selectAll();
        return pendingBankCases;
    }

    @Override
    public int updateByRegistrationOfCasesId(PendingBankCases record) {
        String yyyyMMdd = new SimpleDateFormat().format(new Date());
        if (record.getTime() == null) record.setTime(yyyyMMdd);
        int status = pendingBankCases.updateByRegistrationOfCasesId(record);
        return status;
    }

    @Override
    public int updateByPrimaryKeySelective(PendingBankCases record) {
        int status = pendingBankCases.updateByPrimaryKeySelective(record);
        return status;
    }

    @Override
    public int updateByPrimaryKey(PendingBankCases record) {
        int status = pendingBankCases.updateByPrimaryKey(record);
        return status;
    }
}
