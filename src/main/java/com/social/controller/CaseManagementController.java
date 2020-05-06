package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.CaseManagement;
import com.social.service.CaseManagementService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("caseManagement")
public class CaseManagementController {
    @Resource
    private CaseManagementService caseManagement;

    @RequestMapping("insert")
    @ResponseBody
    public String insert(CaseManagement caseManagement) {
        caseManagement.setStatus(0);
        int status = this.caseManagement.insertSelective(caseManagement);
        return JSON.toJSONString(status);
    }

    @RequestMapping("update")
    @ResponseBody
    public String update(CaseManagement caseManagement) {
        System.out.println(caseManagement);
        int status = this.caseManagement.updateByRegistrationOfCasesId(caseManagement);
        return JSON.toJSONString(status);
    }

    @RequestMapping("selectById")
    @ResponseBody
    public String selectById(Integer id) {
        System.out.println(id);
        CaseManagement caseManagement = this.caseManagement.selectByRegistrationOfCasesId(id);
        System.out.println(caseManagement);
        return JSON.toJSONString(caseManagement);
    }
}
