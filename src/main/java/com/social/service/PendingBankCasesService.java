package com.social.service;

import com.social.pojo.PendingBankCases;

import java.util.List;

public interface PendingBankCasesService {

    int deleteByPrimaryKey(Integer id);

    int insert(PendingBankCases record);

    int insertSelective(PendingBankCases record);

    PendingBankCases selectByPrimaryKey(Integer id);

    List<PendingBankCases> selectAll();

    int updateByRegistrationOfCasesId(PendingBankCases record);

    int updateByPrimaryKeySelective(PendingBankCases record);

    int updateByPrimaryKey(PendingBankCases record);
}
