package com.social.dao;

import com.social.pojo.Change;

public interface ChangeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Change record);

    int insertSelective(Change record);

    Change selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Change record);

    int updateByPrimaryKey(Change record);
}