package com.social.serviceImpl;

import com.social.dao.NotificationCaseManagementMapper;
import com.social.pojo.NotificationCaseManagement;
import com.social.service.NotificationCaseManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class NotificationCaseManagementServiceImpl implements NotificationCaseManagementService {
    @Autowired
    private NotificationCaseManagementMapper notificationCaseManagement;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        int status = notificationCaseManagement.deleteByPrimaryKey(id);
        return status;
    }

    @Override
    public int insert(NotificationCaseManagement record) {
        int status = notificationCaseManagement.insert(record);
        return status;
    }

    @Override
    public int insertSelective(NotificationCaseManagement record) {
        int status = notificationCaseManagement.insertSelective(record);
        return status;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public NotificationCaseManagement selectByPrimaryKey(Integer id) {
        NotificationCaseManagement notificationCaseManagement = this.notificationCaseManagement.selectByPrimaryKey(id);
        return notificationCaseManagement;
    }

    @Override
    public int updateByPrimaryKeySelective(NotificationCaseManagement record) {
        int status = notificationCaseManagement.updateByPrimaryKeySelective(record);
        return status;
    }

    @Override
    public int updateByRegistrationOfCasesId(NotificationCaseManagement record) {
        int status = notificationCaseManagement.updateByRegistrationOfCasesId(record);
        return status;
    }

    @Override
    public int updateByPrimaryKey(NotificationCaseManagement record) {
        int status = notificationCaseManagement.updateByPrimaryKey(record);
        return status;
    }
}
