package com.project.role.dao;

import com.project.role.entity.Role;

public interface RoleMapper {
    int insert(Role record);

    int insertSelective(Role record);
}