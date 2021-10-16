package com.computer.service;

import com.computer.model.User;

/**
 * 用户service层接口
 */
public interface UserService {

    //通过用户编号查询用户
    public User getUserById(int id);

    //通过用户名和密码查询用户
    public User findUser(String userName, String password);

}
