package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.NewCaseManagementForm;
import com.social.pojo.RegistrationOfCases;
import com.social.pojo.Ultimate;
import com.social.service.NewCaseManagementFormService;
import com.social.service.UltimateService;
import com.social.util.PageUtil;
import com.social.util.StatusUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("ultimate")
public class UltimateController {
    @Autowired
    private UltimateService ultimateService;
    @Autowired
    private NewCaseManagementFormService newCaseManagementForm;

    @RequestMapping("selectByPage")
    public String select(Integer typeStatus, Integer approvalStatus, Integer page, Integer pageNum, HttpSession session, Integer status) {
        //状态方法
        Map<String, Integer> mapStatus = StatusUtil.status(typeStatus, approvalStatus);
        //获取状态
        Integer status1 = mapStatus.get("typeStatus");
        Integer status2 = mapStatus.get("approvalStatus");
        //所有条数
        Integer count = ultimateService.ultimateSelectCount(null, null, null, status1, status2);
        //分页方法
        Map<String, Integer> util = PageUtil.page(pageNum, page, count);
        Integer pages = util.get("page");
        Integer num = util.get("pageNum");
        Integer remaining_pages = util.get("remaining_pages");
        Integer counts = util.get("count");
        //分页数据
        List<RegistrationOfCases> registrationOfCases = ultimateService.ultimateSelectPage(status1, status2, pages, num);
        Map<String, Object> map = new HashMap<String, Object>();
        //存入分页数据
        map.put("num", remaining_pages);
        map.put("page", pages);
        map.put("count", counts);
        //存入map集合
        session.setAttribute("map", map);
        //存入分页后的数据
        session.setAttribute("data", registrationOfCases);
        if (status == 7) {
            return "redirect:/AuditNcmFormController/selectAll";
        } else if (status == 10) {
            return "redirect:/PendingBankCases/selectAll";
        } else {
            return StatusUtil.statusYe(status);
        }
    }

    @RequestMapping("selectByLike")
    public String caseRegistrationLike(String unitName, String organizationalCode, String nameOfRegistrant, Integer page, Integer pageNum, HttpSession session, Integer status, Integer typeStatus, Integer approvalStatus) {
        //状态方法
        Map<String, Integer> likeStatus = StatusUtil.status(typeStatus, approvalStatus);
        //获取状态
        Integer status1 = likeStatus.get("typeStatus");
        Integer status2 = likeStatus.get("approvalStatus");
        //所有条数
        Integer count = ultimateService.ultimateSelectCount("%" + unitName + "%", "%" + nameOfRegistrant + "%", "%" + organizationalCode + "%", status1, status2);
        //分页方法
        Map<String, Integer> util = PageUtil.page(pageNum, page, count);
        Integer pages = util.get("page");
        Integer num = util.get("pageNum");
        Integer remaining_pages = util.get("remaining_pages");
        Integer counts = util.get("count");
        //分页数据
        List<RegistrationOfCases> registrationOfCasess = ultimateService.ultimateSelectLike("%" + unitName + "%", "%" + nameOfRegistrant + "%", "%" + organizationalCode + "%", status1, status2, pages, num);
        //模糊查询
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("nums", remaining_pages);
        map.put("pages", pages);
        map.put("counts", counts);
        //存入map集合
        session.setAttribute("map", map);
        //存入分页数据
        session.setAttribute("data", registrationOfCasess);
        //存入前台请求的模糊查询字段（分页使用）
        session.setAttribute("unitName", unitName);
        session.setAttribute("organizationalCode", organizationalCode);
        session.setAttribute("nameOfRegistrant", nameOfRegistrant);
        //根据状态返回页面
        return StatusUtil.statusYe(status);
    }

    //根据id查询数据
    @RequestMapping(value = "selectById", produces = "text/application;charset=utf-8")
    @ResponseBody
    public String selectById(Integer id) {
        Ultimate ultimate = ultimateService.selectByPrimaryKey(id);
        return JSON.toJSONString(ultimate);
    }

    //科长审批通过与不通过
    @RequestMapping("updateStatus")
    @ResponseBody
    public String updateStatus(Integer approvalStatus, Integer typeStatus, Integer id, HttpSession session) {
        if (approvalStatus == 1) {
            //审核通过
            ultimateService.updateStatus(approvalStatus, typeStatus, id);
            NewCaseManagementForm newCaseManagementForm = new NewCaseManagementForm();
            Integer state = (Integer) session.getAttribute("state");
            newCaseManagementForm.setRegistrationOfCasesId(id);
            if (newCaseManagementForm.getState() == null) newCaseManagementForm.setState(0);
            newCaseManagementForm.setState(state);
            this.newCaseManagementForm.insertSelective(newCaseManagementForm);
        } else if (approvalStatus == 2) {
            //审核不通过
            ultimateService.updateStatus(approvalStatus, typeStatus, id);
        }
        return JSON.toJSONString(id);
    }

    //修改数据
    @RequestMapping("update")
    @ResponseBody
    public String update(Ultimate ultimate) {
        int status = ultimateService.updateByPrimaryKeySelective(ultimate);
        return JSON.toJSONString(status);
    }
}
