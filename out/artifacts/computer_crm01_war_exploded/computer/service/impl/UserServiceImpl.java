package com.computer.service.impl;

import com.computer.dao.UserDao;
import com.computer.model.User;
import com.computer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户 Service 接口实现类
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User getUserById(int id) {
        User user = this.userDao.getUserById(id);
        return user;
    }

    @Override
    public User findUser(String userName, String password) {
        User user = this.userDao.findUser(userName,password);
        return user;
    }
}
