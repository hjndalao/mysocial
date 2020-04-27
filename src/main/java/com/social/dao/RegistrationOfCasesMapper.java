package com.social.dao;

import com.social.pojo.RegistrationOfCases;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RegistrationOfCasesMapper {
    //案件登记分页查询
    List<RegistrationOfCases> caseRegistrationPage(@Param("typeStatus")Integer typeStatus,@Param("approvalStatus")Integer approvalStatus,@Param("page") Integer page, @Param("pageNum") Integer pageNum);
    //案件登记所有条数以及模糊查询返回条数
    Integer caseRegistrationCount(@Param("unitName") String unitName, @Param("nameOfRegistrant") String nameOfRegistrant, @Param("organizationalCode") String organizationalCode,@Param("typeStatus")Integer typeStatus,@Param("approvalStatus")Integer approvalStatus);
    //案件登记模糊查询
    List<RegistrationOfCases> caseRegistrationLike(@Param("unitName") String unitName, @Param("nameOfRegistrant") String nameOfRegistrant, @Param("organizationalCode") String organizationalCode, @Param("typeStatus")Integer typeStatus,@Param("approvalStatus")Integer approvalStatus,@Param("page") Integer page, @Param("pageNum") Integer pageNUm);
    //日常审计分页查询
    List<RegistrationOfCases> selectAllDaily(@Param("page") Integer page, @Param("pageNum") Integer pageNUm);
    //修改状态(approval_status)案件提交功能
    int updateStatus(@Param("approvalStatus")Integer approvalStatus,@Param("typeStatus")Integer typeStatus,@Param("id")Integer id);
    //根据主键查询
    RegistrationOfCases selectByPrimaryKey(Integer id);
    //添加方法
    int insert(RegistrationOfCases record);
    //动态根据id修改
    int updateByPrimaryKeySelective(RegistrationOfCases record);
    //根据主键删除
    int deleteByPrimaryKey(Integer id);

    int insertSelective(RegistrationOfCases record);

    int updateByPrimaryKey(RegistrationOfCases record);

    Integer selectAllDailyCount();

    RegistrationOfCases selectRegistrationOfCases(String unitName, String organizationalCode, String nameOfTheComplainant);

    Map<String, Object> selectBypage(int pare, int number);
}