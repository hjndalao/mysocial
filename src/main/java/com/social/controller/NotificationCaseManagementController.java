package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.AuditNcmForm;
import com.social.pojo.NotificationCaseManagement;
import com.social.service.AuditNcmFormService;
import com.social.service.NotificationCaseManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("NotificationCaseManagement")
public class NotificationCaseManagementController {
    @Autowired
    private NotificationCaseManagementService notificationCaseManagement;
    @Autowired
    private AuditNcmFormService auditNcmForm;

    @RequestMapping("update")
    @ResponseBody
    public String update(NotificationCaseManagement notificationCaseManagement, Integer s) {
        //修改状态
        int status = this.notificationCaseManagement.updateByRegistrationOfCasesId(notificationCaseManagement);
        if (s != null) {
            //查询缴费基数
            AuditNcmForm auditNcmForm = this.auditNcmForm.selectByRegistrationOfCasesId(notificationCaseManagement.getRegistrationOfCasesId());
            if (auditNcmForm != null) {
                //修改缴费基数
                this.auditNcmForm.updateByRegistrationOfCasesIdSelective(notificationCaseManagement.getRegistrationOfCasesId(), null, auditNcmForm.getBaseOfPayment() + 25);
            }
        }
        return JSON.toJSONString(status);
    }
}
