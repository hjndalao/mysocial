package com.social.controller;

import com.alibaba.fastjson.JSON;
import com.social.pojo.Changes;
import com.social.pojo.RegistrationOfCases;
import com.social.pojo.Ultimate;
import com.social.service.ChangesService;
import com.social.service.RegistraionOfCasesService;
import com.social.service.UltimateService;
import com.social.util.PageUtil;
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
@RequestMapping("registraionOfCases")
public class RegistraionOfCassesController {

    @Autowired
    private RegistraionOfCasesService registraionOfCasesService;
    @Autowired
    private ChangesService changeService;
    @Autowired
    private UltimateService ultimates;

    /*
         typeStatus 类型状态 (1、立案登记 2、日常审批 3、专项审批)
         approvalStatus 审批状态 (0：提交未审批，1：审批通过，2：审批未通过，3：结案归档,4:立案未提交);
     */
    //案件分页查询
    @RequestMapping("caseRegistrationPage")
    public String caseRegistrationPage(Integer typeStatus, Integer approvalStatus, Integer page, Integer pageNum, HttpSession session, Integer status) {
        //状态方法
        Map<String, Integer> mapStatus = StatusUtil.status(typeStatus, approvalStatus);
        //获取状态
        Integer status1 = mapStatus.get("typeStatus");
        Integer status2 = mapStatus.get("approvalStatus");
        //所有条数
        Integer count = registraionOfCasesService.caseRegistrationCount(null, null, null, status1, status2);
        //分页方法
        Map<String, Integer> util = PageUtil.page(pageNum, page, count);
        Integer pages = util.get("page");
        Integer num = util.get("pageNum");
        Integer remaining_pages = util.get("remaining_pages");
        Integer counts = util.get("count");
        //分页数据
        List<RegistrationOfCases> registrationOfCases = registraionOfCasesService.caseRegistrationPage(status1, status2, pages, num);
        Map<String, Object> map = new HashMap<String, Object>();
        //存入分页数据
        map.put("num", remaining_pages);
        map.put("page", pages);
        map.put("count", counts);
        //存入map集合
        session.setAttribute("map", map);
        //存入分页后的数据
        session.setAttribute("data", registrationOfCases);
        //根据状态返回页面
        return StatusUtil.statusYe(status);
    }

    //案件模糊查询
    @RequestMapping("caseRegistrationLike")
    public String caseRegistrationLike(String unitName, String organizationalCode, String nameOfRegistrant, Integer page, Integer pageNum, HttpSession session, Integer status, Integer typeStatus, Integer approvalStatus) {
        //状态方法
        Map<String, Integer> likeStatus = StatusUtil.status(typeStatus, approvalStatus);
        //获取状态
        Integer status1 = likeStatus.get("typeStatus");
        Integer status2 = likeStatus.get("approvalStatus");
        //所有条数
        Integer count = registraionOfCasesService.caseRegistrationCount("%" + unitName + "%", "%" + nameOfRegistrant + "%", "%" + organizationalCode + "%", status1, status2);
        //分页方法
        Map<String, Integer> util = PageUtil.page(pageNum, page, count);
        Integer pages = util.get("page");
        Integer num = util.get("pageNum");
        Integer remaining_pages = util.get("remaining_pages");
        Integer counts = util.get("count");
        //分页数据
        List<RegistrationOfCases> registrationOfCasess = registraionOfCasesService.caseRegistrationLike("%" + unitName + "%", "%" + nameOfRegistrant + "%", "%" + organizationalCode + "%", status1, status2, pages, num);
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

    //案件主键查询
    @RequestMapping(value = "selectById", produces = "text/application;charset=utf-8")
    @ResponseBody
    public String selectById(Integer id) {
        RegistrationOfCases registrationOfCases = registraionOfCasesService.selectByPrimaryKey(id);
        return JSON.toJSONString(registrationOfCases);
    }

    //来案登记添加  (typeStatus:1 approvalStatus:4)
    //日常审计添加  (typeStatus:2,approvalStatus:0)
    @RequestMapping("insert")
    @ResponseBody
    public String insert(RegistrationOfCases registrationOfCases) {
        //调用插入数据方法
        int insert = registraionOfCasesService.insert(registrationOfCases);
        //返回插入状态
        return JSON.toJSONString(insert);
    }

    public Ultimate getUltimate(Integer approvalStatus, RegistrationOfCases registrationOfCases) {
        //当立案审核通过 转至科长审核
        Ultimate ultimate = new Ultimate();
        if (approvalStatus == 1) {
            ultimate.setUnitName(registrationOfCases.getUnitName());
            ultimate.setOrganizationalCode(registrationOfCases.getOrganizationalCode());
            ultimate.setNameOfTheComplainant(registrationOfCases.getNameOfTheComplainant());
            ultimate.setIdCard(registrationOfCases.getIdCard());
            ultimate.setPhone(registrationOfCases.getPhone());
            ultimate.setAccountCharacter(registrationOfCases.getAccountCharacter());
            ultimate.setAge(registrationOfCases.getAge());
            ultimate.setSex(registrationOfCases.getSex());
            ultimate.setComplaintContents(registrationOfCases.getComplaintContents());
            ultimate.setNameOfRegistrant(registrationOfCases.getNameOfRegistrant());
            ultimate.setRegistrationTime(registrationOfCases.getRegistrationTime());
            ultimate.setNameOfTheFiler(registrationOfCases.getNameOfTheFiler());
            ultimate.setFilingMonth(registrationOfCases.getFilingMonth());
            ultimate.setFilingTime(registrationOfCases.getFilingTime());
            ultimate.setApprovalStatus(0);
            ultimate.setWarningTime(0);
            ultimate.setNumberOfAuditors(registrationOfCases.getNumberOfAuditors());
            ultimate.setAuditHouseholds(registrationOfCases.getAuditHouseholds());
            ultimate.setAmountPaid(registrationOfCases.getAmountPaid());
            ultimate.setTypeStatus(registrationOfCases.getTypeStatus());
        }
        return ultimate;
    }

    //案件修改状态
    @RequestMapping("updateStatus")
    @ResponseBody
    public String updateStatus(Integer approvalStatus, Integer typeStatus, Integer id) {
        //立案审批通过
        registraionOfCasesService.updateStatus(approvalStatus, typeStatus, id);
        //根据主键id查询
        RegistrationOfCases registrationOfCases = registraionOfCasesService.selectByPrimaryKey(id);
        //添加科长审批数据
        Ultimate ultimate = getUltimate(approvalStatus, registrationOfCases);
        ultimates.insertSelective(ultimate);
        return JSON.toJSONString(id);
    }

    //案件登记修改,日常审计修改（模态框）
    @RequestMapping("update")
    @ResponseBody
    public String update(RegistrationOfCases registrationOfCases, Changes change) {
        //修改操作 动态sql
        int status = registraionOfCasesService.updateByPrimaryKeySelective(registrationOfCases);
        //判断操作成功 并且 操作人不为null执行
        if (status == 1 && registrationOfCases.getNameOfRegistrant() != null) {
            //操作内容
            String context = " 修改的id是:" + registrationOfCases.getId() + " 公司是:" + registrationOfCases.getUnitName() + " 电话是:" + registrationOfCases.getPhone();
            //设置id
            change.setId(null);
            //操作人
            change.setChangeOperator(registrationOfCases.getNameOfRegistrant());
            //操作原因
            change.setOperationContent(context);
            //添加方法
            changeService.insertSelective(change);
        }
        //返回修改状态
        return JSON.toJSONString(status);
    }

    //案件的登记数据删除,日常审计数据删除 (将type_status改成0)
    @RequestMapping("delete")
    @ResponseBody
    public String delete(Integer id, Changes change, String nameOfRegistrant, String unitName, String phone) {
        //删除操作
        int status = registraionOfCasesService.deleteByPrimaryKey(id);
        //判断操作成功 并且 操作人不为null执行
        if (status == 1 && nameOfRegistrant != null) {
            //设置id
            change.setId(null);
            //操作人
            change.setChangeOperator(nameOfRegistrant);
            //操作原因
            change.setOperationContent("删除的id是:" + id + " 删除的公司是:" + unitName + " 电话是:" + phone);
            changeService.insertSelective(change);
        }
        return JSON.toJSONString(status);
    }
}