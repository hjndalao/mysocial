package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.RegistrationOfCases;
import com.social.service.RegistraionOfCasesService;
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
@RequestMapping("registraionOfCases")
public class RegistraionOfCassesController {
    @Autowired
    private RegistraionOfCasesService registraionOfCasesService;

    //分页方法
    public Map<String, Integer> pageUtil(Integer pageNum, Integer page, Integer count) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        //当前页
        if (page == null) page = 1;
        //每页显示条数
        if (pageNum == null) pageNum = 5;
        //剩余页数
        int remaining_pages = 0;
        //处理显示多少页
        if (count % pageNum == 0) {
            remaining_pages = count / pageNum;
        } else {
            remaining_pages = count / pageNum + 1;
        }
        map.put("page", page);
        map.put("pageNum", pageNum);
        map.put("remaining_pages", remaining_pages);
        return map;
    }

    //状态方法
    public Map<String, Integer> status(Integer typeStatus, Integer approvalStatus) {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        //类型状态
        if (typeStatus == null) typeStatus = 1;
        //审批状态
        if (approvalStatus == null) approvalStatus = 4;
        map.put("typeStatus", typeStatus);
        map.put("approvalStatus", approvalStatus);
        return map;
    }

    /*
        typeStatus 类型状态 (1、立案登记 2、日常审批 3、专项审批)
        approvalStatus 审批状态 (0：提交未审批，1：审批通过，2：审批未通过，3：结案归档,4:立案未提交);
    */
    //案件登记分页查询
    @RequestMapping("caseRegistrationPage")
    public String caseRegistrationPage(Integer typeStatus, Integer approvalStatus, Integer page, Integer pageNum, HttpSession session) {
        //状态方法
        Map<String, Integer> status = status(typeStatus, approvalStatus);
        //获取状态
        Integer status1 = status.get("typeStatus");
        Integer status2 = status.get("approvalStatus");
        //所有条数
        Integer count = registraionOfCasesService.caseRegistrationCount(status1, status2);
        //分页方法
        Map<String, Integer> util = pageUtil(pageNum, page, count);
        Integer pages = util.get("page");
        Integer num = util.get("pageNum");
        Integer remaining_pages = util.get("remaining_pages");
        //分页数据
        List<RegistrationOfCases> registrationOfCases = registraionOfCasesService.caseRegistrationPage(status1, status2, pages, num);
        Map<String, Object> map = new HashMap<String, Object>();
        //存入分页数据
        map.put("num", remaining_pages);
        map.put("page", pages);
        //存入map集合
        session.setAttribute("map", map);
        //存入分页后的数据
        session.setAttribute("data", registrationOfCases);
        //跳转案件登记页面
        return "redirect:/registrationOfCases.jsp";
    }

    /*
           typeStatus 类型状态 (1、立案登记 2、日常审批 3、专项审批)
           approvalStatus 审批状态 (0：提交未审批，1：审批通过，2：审批未通过，3：结案归档,4:立案未提交);
    */
    //案件登记模糊查询
    @RequestMapping("caseRegistrationLike")
    public String caseRegistrationLike(String unitName, String organizationalCode, String nameOfRegistrant, Integer page, Integer pageNum, HttpSession session, Integer status, Integer typeStatus, Integer approvalStatus) {
        //状态方法
        Map<String, Integer> likeStatus = status(typeStatus, approvalStatus);
        //获取状态
        Integer status1 = likeStatus.get("typeStatus");
        Integer status2 = likeStatus.get("approvalStatus");
        //所有条数
        Integer count = registraionOfCasesService.pageByLikeSelectCount("%" + unitName + "%", "%" + nameOfRegistrant + "%", "%" + organizationalCode + "%");
        //分页方法
        Map<String, Integer> util = pageUtil(pageNum, page, count);
        Integer pages = util.get("page");
        Integer num = util.get("pageNum");
        Integer remaining_pages = util.get("remaining_pages");
        //分页数据
        List<RegistrationOfCases> registrationOfCasess = registraionOfCasesService.caseRegistrationLike("%" + unitName + "%", "%" + nameOfRegistrant + "%", "%" + organizationalCode + "%", status1, status2, pages, num);
        //模糊查询
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("nums", remaining_pages);
        map.put("pages", pages);
        //存入map集合
        session.setAttribute("map", map);
        //存入分页数据
        session.setAttribute("data", registrationOfCasess);
        //存入前台请求的模糊查询字段（分页使用）
        session.setAttribute("unitName", unitName);
        session.setAttribute("organizationalCode", organizationalCode);
        session.setAttribute("nameOfRegistrant", nameOfRegistrant);
        //根据状态返回页面
        if (status == 1) {
            System.out.println("运行1");
            return "redirect:/daily_audit.jsp";
        } else if (status == 2) {
            System.out.println("运行2");
            return "redirect:/registrationOfCases.jsp";
        } else {
            return "";
        }
    }

    //案件登记主键查询
    @RequestMapping(value = "selectById", produces = "text/application;charset=utf-8")
    @ResponseBody
    public String selectById(Integer id) {
        RegistrationOfCases registrationOfCases = registraionOfCasesService.selectByPrimaryKey(id);
        return JSON.toJSONString(registrationOfCases);
    }

    //登记案件添加
    @RequestMapping("insert")
    @ResponseBody
    public String insert(RegistrationOfCases registrationOfCases) {
        //日期格式转换
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String format = sdf.format(date);
        //设置时间
        registrationOfCases.setRegistrationTime(format);
        //设置状态
        registrationOfCases.setTypeStatus(1);
        registrationOfCases.setApprovalStatus(4);
        int insert = registraionOfCasesService.insert(registrationOfCases);
        return JSON.toJSONString(insert);
    }

    //案件登记修改（模态框）
    @RequestMapping("update")
    @ResponseBody
    public String update(RegistrationOfCases registrationOfCases) {
        //修改操作 动态sql
        int status = registraionOfCasesService.updateByPrimaryKeySelective(registrationOfCases);
        return JSON.toJSONString(status);
    }

    //案件登记修改状态
    @RequestMapping("updateStatus")
    @ResponseBody
    public String updateStatus(Integer approvalStatus, Integer typeStatus, Integer id) {
        int status = registraionOfCasesService.updateStatus(approvalStatus, typeStatus, id);
        return JSON.toJSONString(status);
    }

    //案件登记删除
    @RequestMapping("delete")
    @ResponseBody
    public String delete(Integer id) {
        int status = registraionOfCasesService.deleteByPrimaryKey(id);
        return JSON.toJSONString(status);
    }
}