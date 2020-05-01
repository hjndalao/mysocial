package com.social.dao;

import com.social.pojo.Changes;

public interface ChangesMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Changes record);

    int insertSelective(Changes record);

    Changes selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Changes record);

    int updateByPrimaryKey(Changes record);
}