package com.social.dao;

import com.social.pojo.PendingBankCases;

import java.util.List;

public interface PendingBankCasesMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(PendingBankCases record);

    int insertSelective(PendingBankCases record);

    PendingBankCases selectByPrimaryKey(Integer id);

    int updateByRegistrationOfCasesId(PendingBankCases record);

    List<PendingBankCases> selectAll();

    int updateByPrimaryKeySelective(PendingBankCases record);

    int updateByPrimaryKey(PendingBankCases record);
}