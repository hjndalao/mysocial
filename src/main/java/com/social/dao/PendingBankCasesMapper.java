package com.social.dao;

import com.social.pojo.PendingBankCases;

public interface PendingBankCasesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PendingBankCases record);

    int insertSelective(PendingBankCases record);

    PendingBankCases selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PendingBankCases record);

    int updateByPrimaryKey(PendingBankCases record);
}