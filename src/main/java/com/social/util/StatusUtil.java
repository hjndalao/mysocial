package com.social.util;

import java.util.HashMap;
import java.util.Map;

public class StatusUtil {

    //状态方法
    public static Map<String, Integer> status(Integer typeStatus, Integer approvalStatus) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        //类型状态
        if (typeStatus != null) {
            map.put("typeStatus", typeStatus);
        }
        if (approvalStatus != null) {
            map.put("approvalStatus", approvalStatus);
        }
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
        } else if (status == 7) {
            return "redirect:/audit_ncm_form.jsp";
        } else if (status == 8) {
            return "redirect:/case_management.jsp";
        } else if (status == 9) {
            return "redirect:/notification_case_management.jsp";
        } else if (status == 10) {
            return "redirect:/pending_bank_cases.jsp";
        } else if (status == 11) {
            return "redirect:/enforcement.jsp";
        } else if (status == 12) {
            return "redirect:/registrationOfCases01.jsp";
        } else {
            return "";
        }
    }
}