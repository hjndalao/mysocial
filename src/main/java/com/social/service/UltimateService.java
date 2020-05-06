package com.social.service;

import com.social.pojo.RegistrationOfCases;
import com.social.pojo.Ultimate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UltimateService {
    List<Ultimate> selectAll();

    int deleteByPrimaryKey(Integer id);

    int insert(Ultimate record);

    int insertSelective(Ultimate record);

    Ultimate selectByPrimaryKey(Integer id);

    //科长审核分页查询
    List<RegistrationOfCases> ultimateSelectPage(Integer typeStatus, Integer approvalStatus, Integer page, Integer pageNum);

    //科长审核所有条数以及模糊查询返回条数
    Integer ultimateSelectCount(String unitName, String nameOfRegistrant, String organizationalCode, Integer typeStatus, Integer approvalStatus);

    //科长审核模糊查询
    List<RegistrationOfCases> ultimateSelectLike(String unitName, String nameOfRegistrant, String organizationalCode, Integer typeStatus, Integer approvalStatus, Integer page, Integer pageNUm);

    //科长审核修改状态
    int updateStatus(Integer approvalStatus, Integer typeStatus, Integer id);

    int updateByPrimaryKeySelective(Ultimate record);

    int updateByPrimaryKey(Ultimate record);
}
