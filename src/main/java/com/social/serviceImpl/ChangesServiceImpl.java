package com.social.serviceImpl;

import com.social.dao.ChangesMapper;
import com.social.pojo.Changes;
import com.social.service.ChangesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ChangesServiceImpl implements ChangesService {
    @Autowired
    private ChangesMapper changeMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int status = changeMapper.deleteByPrimaryKey(id);
        return status;
    }

    @Override
    public int insert(Changes record) {
        int status = changeMapper.insert(record);
        return status;
    }

    @Override
    public int insertSelective(Changes record) {
        int status = changeMapper.insertSelective(record);
        return status;
    }
    @Transactional(propagation= Propagation.SUPPORTS,readOnly = true)
    @Override
    public Changes selectByPrimaryKey(Integer id) {
        Changes change = changeMapper.selectByPrimaryKey(id);
        return change;
    }

    @Override
    public int updateByPrimaryKeySelective(Changes record) {
        int status = changeMapper.updateByPrimaryKeySelective(record);
        return status;
    }

    @Override
    public int updateByPrimaryKey(Changes record) {
        int status = changeMapper.updateByPrimaryKey(record);
        return status;
    }
}
