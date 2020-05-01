package com.social.util;

import java.util.HashMap;
import java.util.Map;

public class StatusUtil {

    //状态方法
    public static Map<String, Integer> status(Integer typeStatus, Integer approvalStatus) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        //类型状态
        if (typeStatus == null) typeStatus = 1;
        //审批状态
        if (approvalStatus == null) approvalStatus = 4;
        map.put("typeStatus", typeStatus);
        map.put("approvalStatus", approvalStatus);
        return map;
    }

    //根据状态返回页面
    public static String statusYe(Integer status) {
        if (status == 1) {
            return "redirect:/daily_audit.jsp";
        } else if (status == 2) {
            return "redirect:/registrationOfCases.jsp";
        } else if (status == 3) {
            return "redirect:/special_audit.jsp";
        } else if (status == 4) {
            return "redirect:/approval.jsp";
        } else if (status == 5) {
            return "redirect:/registrationOfCases02.jsp";
        } else if (status == 6) {
            return "redirect:/new_case_management_form.jsp";
        } else
            return "";
    }
}
