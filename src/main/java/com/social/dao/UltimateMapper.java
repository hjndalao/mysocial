package com.social.dao;

import com.social.pojo.RegistrationOfCases;
import com.social.pojo.Ultimate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UltimateMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Ultimate record);

    int insertSelective(Ultimate record);

    Ultimate selectByPrimaryKey(Integer id);

    List<Ultimate> selectAll();

    //科长审核分页查询
    List<RegistrationOfCases> ultimateSelectPage(@Param("typeStatus") Integer typeStatus, @Param("approvalStatus") Integer approvalStatus, @Param("page") Integer page, @Param("pageNum") Integer pageNum);

    //科长审核所有条数以及模糊查询返回条数
    Integer ultimateSelectCount(@Param("unitName") String unitName, @Param("nameOfRegistrant") String nameOfRegistrant, @Param("organizationalCode") String organizationalCode, @Param("typeStatus") Integer typeStatus, @Param("approvalStatus") Integer approvalStatus);

    //科长审核模糊查询
    List<RegistrationOfCases> ultimateSelectLike(@Param("unitName") String unitName, @Param("nameOfRegistrant") String nameOfRegistrant, @Param("organizationalCode") String organizationalCode, @Param("typeStatus") Integer typeStatus, @Param("approvalStatus") Integer approvalStatus, @Param("page") Integer page, @Param("pageNum") Integer pageNUm);

    //科长审核修改状态
    int updateStatus(@Param("approvalStatus") Integer approvalStatus, @Param("typeStatus") Integer typeStatus, @Param("id") Integer id);

    int updateByPrimaryKeySelective(Ultimate record);

    int updateByPrimaryKey(Ultimate record);
}