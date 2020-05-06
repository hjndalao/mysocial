package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.TerminationOfFilingForm;
import com.social.service.TerminationOfFilingFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("terminationOfFilingForm")
public class TerminationOfFilingFormController {
    @Autowired
    private TerminationOfFilingFormService terminationOfFilingFormService;

    @RequestMapping("insert")
    @ResponseBody
    public String insertOrUpdate(TerminationOfFilingForm terminationOfFilingForm, HttpSession session) {
        Integer ids = (Integer) session.getAttribute("ids");
        TerminationOfFilingForm terminationOfFilingForm1 = terminationOfFilingFormService.selectByPrimaryKey(ids);
        int status = 0;
        if (terminationOfFilingForm1 == null) {
            status = terminationOfFilingFormService.insert(terminationOfFilingForm);
        } else {
            status = terminationOfFilingFormService.updateByRegistrationOfCasesId(terminationOfFilingForm);
        }
        return JSON.toJSONString(status);
    }
}
