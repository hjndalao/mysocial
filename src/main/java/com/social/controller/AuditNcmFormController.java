package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.AuditNcmForm;
import com.social.service.AuditNcmFormService;
import com.social.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("AuditNcmFormController")
public class AuditNcmFormController {
    @Autowired
    private AuditNcmFormService auditNcmForm;

    @RequestMapping("selectAll")
    public String status(HttpSession session) {
        List<AuditNcmForm> auditNcmForms = auditNcmForm.selectAll();
        System.out.println("调用");
        session.setAttribute("datas", auditNcmForms);
        return StatusUtil.statusYe(7);
    }

    @RequestMapping("update")
    @ResponseBody
    public String update(Integer id, Integer baseOfPayment) {
        int status = auditNcmForm.updateByRegistrationOfCasesIdSelective(id, null, baseOfPayment);
        return JSON.toJSONString(status);
    }

    @RequestMapping("selectByRegistrationOfCasesId")
    @ResponseBody
    public String selectByRegistrationOfCasesId(Integer registrationOfCasesId) {
        AuditNcmForm auditNcmForm = this.auditNcmForm.selectByRegistrationOfCasesId(registrationOfCasesId);
        return JSON.toJSONString(auditNcmForm);
    }
}
