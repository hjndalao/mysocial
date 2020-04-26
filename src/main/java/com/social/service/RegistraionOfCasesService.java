package com.social.service;

import com.social.pojo.RegistrationOfCases;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


public interface RegistraionOfCasesService {
    //案件登记分页查询
    List<RegistrationOfCases> caseRegistrationPage(Integer typeStatus, Integer approvalStatus, Integer page, Integer pageNum);
    //案件登记所有条数查询
    Integer caseRegistrationCount(Integer typeStatus, Integer approvalStatus);
    //案件登记模糊查询
    List<RegistrationOfCases> caseRegistrationLike(String unitName,String nameOfRegistrant,String organizationalCode,Integer typeStatus,Integer approvalStatus,Integer page,Integer pageNUm);
    //修改状态(approval_status)案件提交功能
    int updateStatus(Integer approvalStatus,Integer typeStatus,Integer id);

    int deleteByPrimaryKey(Integer id);

    int insert(RegistrationOfCases record);

    int insertSelective(RegistrationOfCases record);

    RegistrationOfCases selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RegistrationOfCases record);

    int updateByPrimaryKey(RegistrationOfCases record);

    Integer pageByLikeSelectCount(String unitName, String nameOfRegistrant, String organizationalCode);

    List<RegistrationOfCases> selectAllDaily(Integer page, Integer pageNUm);

    Integer selectAllDailyCount();

    RegistrationOfCases selectRegistrationOfCases(String unitName, String organizationalCode, String nameOfTheComplainant);

    Map<String, Object> selectBypage(int pare, int number);

/*Map<String,String> insertRegistrationOfCases(RegistrationOfCases registraion);

	Map<String, Object> selectRegistrationOfCases(String unitName, String organizationalCode,
			String nameOfTheComplainant);

	Map<String, Object> selectBypage(int pare, int number);

	Map<String, String> deleteRegistrationOfCases(Integer id);

	Map<String, String> updateRegistrationOfCases(RegistrationOfCases registrationOfCases);*/

}
