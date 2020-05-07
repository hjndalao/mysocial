package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.CaseManagement;
import com.social.pojo.Ultimate;
import com.social.service.CaseManagementService;
import com.social.service.UltimateService;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private UltimateService ultimate;

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
        CaseManagement caseManagement = this.caseManagement.selectByRegistrationOfCasesId(id);
        return JSON.toJSONString(caseManagement);
    }
}
