package com.social.service;

import com.social.pojo.TerminationOfFilingForm;

public interface TerminationOfFilingFormService {

    int deleteByPrimaryKey(Integer id);

    int insert(TerminationOfFilingForm record);

    int insertSelective(TerminationOfFilingForm record);

    TerminationOfFilingForm selectByPrimaryKey(Integer id);

    int updateByRegistrationOfCasesId(TerminationOfFilingForm record);

    int updateByPrimaryKey(TerminationOfFilingForm record);
}
