package com.project.user.service;

import com.project.user.entity.User;

import java.util.List;

public interface UserService {
    List<User> selectByUserName(String uid);
    int insertSelective(User record);
    User selectByAerification(Integer id);
    int updateByPrimaryKeySelective(User record);
}
