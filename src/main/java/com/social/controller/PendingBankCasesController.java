package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.PendingBankCases;
import com.social.service.PendingBankCasesService;
import com.social.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("PendingBankCases")
public class PendingBankCasesController {
    @Autowired
    private PendingBankCasesService pendingBankCases;

    @RequestMapping("selectAll")
    public String selectAll(HttpSession session) {
        List<PendingBankCases> pendingBankCases = this.pendingBankCases.selectAll();
        session.setAttribute("data2", pendingBankCases);
        return StatusUtil.statusYe(10);
    }

    @RequestMapping("insert")
    @ResponseBody
    public String insert(PendingBankCases pendingBankCases) {
        Integer state = pendingBankCases.getState();
        int status = this.pendingBankCases.insertSelective(pendingBankCases);
        return JSON.toJSONString(status);
    }

    @RequestMapping("update")
    @ResponseBody
    public String update(PendingBankCases pendingBankCases) {

        int status = this.pendingBankCases.updateByRegistrationOfCasesId(pendingBankCases);
        return JSON.toJSONString(status);
    }
}
