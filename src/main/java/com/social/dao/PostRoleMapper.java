package com.social.dao;

import com.social.pojo.PostRoleKey;

public interface PostRoleMapper {
    int deleteByPrimaryKey(PostRoleKey key);

    int insert(PostRoleKey record);

    int insertSelective(PostRoleKey record);
}