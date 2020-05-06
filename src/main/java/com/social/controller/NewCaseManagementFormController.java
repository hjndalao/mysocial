package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.AuditNcmForm;
import com.social.pojo.NewCaseManagementForm;
import com.social.pojo.SpecialAuditMaterials;
import com.social.pojo.Ultimate;
import com.social.service.AuditNcmFormService;
import com.social.service.NewCaseManagementFormService;
import com.social.service.SpecialAuditMaterialsService;
import com.social.service.UltimateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("NewCaseManagementForm")
public class NewCaseManagementFormController {
    @Autowired
    private NewCaseManagementFormService newCaseManagementForm;
    @Autowired
    private AuditNcmFormService auditNcmForm;
    @Autowired
    private SpecialAuditMaterialsService specialAuditMaterials;
    @Autowired
    private UltimateService ultimate;

    @RequestMapping("selectByRegistrationOfCasesId")
    @ResponseBody
    public String selectByRegistrationOfCasesId(Integer registrationOfCasesId) {
        //根据registrationOfCasesId查询
        List<NewCaseManagementForm> newCaseManagementForms = newCaseManagementForm.selectByRegistrationOfCasesId(registrationOfCasesId);
        return JSON.toJSONString(newCaseManagementForms);
    }

    @RequestMapping("update")
    @ResponseBody
    public String update(Integer registrationOfCasesId, String serviceTime) throws Exception {
        //修改时间
        int status = newCaseManagementForm.updateByRegistrationOfCasesIdSelective(registrationOfCasesId, serviceTime);
        //查询通知书地址
        SpecialAuditMaterials specialAuditMaterials = this.specialAuditMaterials.selectByRegistrationOfCasesId(registrationOfCasesId);
        System.out.println("id:" + registrationOfCasesId);
        System.out.println("数据:" + specialAuditMaterials);
        //转换时间
        String yyyymmdd = new SimpleDateFormat("yyyy-MM-dd-hh").format(new Date());
        AuditNcmForm auditNcmForm = new AuditNcmForm();
        //设置来案登记表id
        auditNcmForm.setRegistrationOfCasesId(registrationOfCasesId);
        //设置通知书url
        auditNcmForm.setApplicationMaterialsUrl(specialAuditMaterials.getAuditReportUrl());
        //设置申报材料状态
        auditNcmForm.setState(0);
        //设置时间
        auditNcmForm.setTime(yyyymmdd);
        this.auditNcmForm.insertSelective(auditNcmForm);
        List<NewCaseManagementForm> newCaseManagementForms = newCaseManagementForm.selectByRegistrationOfCasesId(registrationOfCasesId);
        for (NewCaseManagementForm caseManagementForm : newCaseManagementForms) {
            Integer id = caseManagementForm.getRegistrationOfCasesId();
            Ultimate ultimate = new Ultimate();
            ultimate.setId(id);
            ultimate.setTypeStatus(6);
            this.ultimate.updateByPrimaryKeySelective(ultimate);
        }
        return JSON.toJSONString(status);
    }
}
