package com.social.dao;

import com.social.pojo.TerminationOfFilingForm;

public interface TerminationOfFilingFormMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TerminationOfFilingForm record);

    int insertSelective(TerminationOfFilingForm record);

    TerminationOfFilingForm selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TerminationOfFilingForm record);

    int updateByPrimaryKey(TerminationOfFilingForm record);
}