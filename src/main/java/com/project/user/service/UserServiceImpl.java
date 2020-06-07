package com.project.user.service;


import com.project.user.dao.UserMapper;
import com.project.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("UserServiceImpl")
public class UserServiceImpl implements  UserService{
   @Autowired
   private UserMapper userMapper;
    @Override
    public List<User> selectByUserName(String uid) {
        return userMapper.selectByUserName(uid);
    }

    @Override
    public int insertSelective(User record) {
        return userMapper.insertSelective(record);
    }

    @Override
    public User selectByAerification(Integer id) {
        return userMapper.selectByAerification(id);
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {
        return userMapper.updateByPrimaryKeySelective(record);
    }
}
