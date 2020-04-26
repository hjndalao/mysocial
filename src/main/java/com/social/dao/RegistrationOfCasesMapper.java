package com.social.dao;

import com.social.pojo.RegistrationOfCases;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RegistrationOfCasesMapper {
    //案件登记分页查询
    List<RegistrationOfCases> caseRegistrationPage(@Param("typeStatus")Integer typeStatus,@Param("approvalStatus")Integer approvalStatus,@Param("page") Integer page, @Param("pageNum") Integer pageNum);
    //案件登记所有条数查询
    Integer caseRegistrationCount(@Param("typeStatus")Integer typeStatus,@Param("approvalStatus")Integer approvalStatus);
    //案件登记模糊查询
    List<RegistrationOfCases> caseRegistrationLike(@Param("unitName") String unitName, @Param("nameOfRegistrant") String nameOfRegistrant, @Param("organizationalCode") String organizationalCode, @Param("typeStatus")Integer typeStatus,@Param("approvalStatus")Integer approvalStatus,@Param("page") Integer page, @Param("pageNum") Integer pageNUm);







    int deleteByPrimaryKey(Integer id);

    int insert(RegistrationOfCases record);

    int insertSelective(RegistrationOfCases record);

    RegistrationOfCases selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RegistrationOfCases record);

    int updateByPrimaryKey(RegistrationOfCases record);



    List<RegistrationOfCases> selectAllDaily(@Param("page") Integer page, @Param("pageNum") Integer pageNUm);

    Integer pageByLikeSelectCount(@Param("unitName") String unitName, @Param("nameOfRegistrant") String nameOfRegistrant, @Param("organizationalCode") String organizationalCode);

    Integer selectAllDailyCount();

    void updateStatus(Integer id);

    RegistrationOfCases selectRegistrationOfCases(String unitName, String organizationalCode, String nameOfTheComplainant);

    Map<String, Object> selectBypage(int pare, int number);
}