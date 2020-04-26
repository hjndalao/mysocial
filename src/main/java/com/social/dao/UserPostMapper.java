package com.social.dao;

import com.social.pojo.UserPostKey;

public interface UserPostMapper {
    int deleteByPrimaryKey(UserPostKey key);

    int insert(UserPostKey record);

    int insertSelective(UserPostKey record);
}