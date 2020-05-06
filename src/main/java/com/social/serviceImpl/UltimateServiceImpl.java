package com.social.serviceImpl;

import com.social.dao.UltimateMapper;
import com.social.pojo.RegistrationOfCases;
import com.social.pojo.Ultimate;
import com.social.service.UltimateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UltimateServiceImpl implements UltimateService {
    @Autowired
    private UltimateMapper ultimateMapper;

    @Override
    public List<Ultimate> selectAll() {
        List<Ultimate> ultimates = ultimateMapper.selectAll();
        return ultimates;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int status = ultimateMapper.deleteByPrimaryKey(id);
        return status;
    }

    @Override
    public int insert(Ultimate record) {
        int status = ultimateMapper.insert(record);
        return status;
    }

    @Override
    public int insertSelective(Ultimate record) {
        int status = ultimateMapper.insertSelective(record);
        return status;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public Ultimate selectByPrimaryKey(Integer id) {
        Ultimate ultimate = ultimateMapper.selectByPrimaryKey(id);
        return ultimate;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public List<RegistrationOfCases> ultimateSelectPage(Integer typeStatus, Integer approvalStatus, Integer page, Integer pageNum) {
        List<RegistrationOfCases> registrationOfCases = ultimateMapper.ultimateSelectPage(typeStatus, approvalStatus, page, pageNum);
        return registrationOfCases;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public Integer ultimateSelectCount(String unitName, String nameOfRegistrant, String organizationalCode, Integer typeStatus, Integer approvalStatus) {
        if ("%%".equals(unitName)) unitName = null;
        if ("%%".equals(nameOfRegistrant)) nameOfRegistrant = null;
        if ("%%".equals(organizationalCode)) organizationalCode = null;
        Integer status = ultimateMapper.ultimateSelectCount(unitName, nameOfRegistrant, organizationalCode, typeStatus, approvalStatus);
        return status;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public List<RegistrationOfCases> ultimateSelectLike(String unitName, String nameOfRegistrant, String organizationalCode, Integer typeStatus, Integer approvalStatus, Integer page, Integer pageNUm) {
        if ("%%".equals(unitName)) unitName = null;
        if ("%%".equals(nameOfRegistrant)) nameOfRegistrant = null;
        if ("%%".equals(organizationalCode)) organizationalCode = null;
        List<RegistrationOfCases> registrationOfCases = ultimateMapper.ultimateSelectLike(unitName, nameOfRegistrant, organizationalCode, typeStatus, approvalStatus, page, pageNUm);
        return registrationOfCases;
    }

    @Override
    public int updateStatus(Integer approvalStatus, Integer typeStatus, Integer id) {
        int status = ultimateMapper.updateStatus(approvalStatus, typeStatus, id);
        return status;
    }

    @Override
    public int updateByPrimaryKeySelective(Ultimate ultimate) {
        if (ultimate.getMaxtime() == null) ultimate.setMaxtime(5);
        int status = ultimateMapper.updateByPrimaryKeySelective(ultimate);
        return status;
    }

    @Override
    public int updateByPrimaryKey(Ultimate record) {
        int status = ultimateMapper.updateByPrimaryKey(record);
        return status;
    }
}
