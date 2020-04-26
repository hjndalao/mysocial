package com.social.dao;

import com.social.pojo.WorkdayMaintenance;

public interface WorkdayMaintenanceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WorkdayMaintenance record);

    int insertSelective(WorkdayMaintenance record);

    WorkdayMaintenance selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WorkdayMaintenance record);

    int updateByPrimaryKey(WorkdayMaintenance record);
}