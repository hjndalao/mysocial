package com.social.dao;

import com.social.pojo.Ultimate;

public interface UltimateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Ultimate record);

    int insertSelective(Ultimate record);

    Ultimate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Ultimate record);

    int updateByPrimaryKey(Ultimate record);
}