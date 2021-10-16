package com.computer.service;

import com.computer.model.User;

import java.util.List;

/**
 * 用户service层接口
 */
public interface UserService {

    // 新增用户记录
    int addUser(String username, String password, String telephone);

    //通过用户编号查询用户
    User findUserById(int id);

    //通过用户名和密码查询用户
    User findUser(String userName, String password);

    // 修改用户记录
    int updateUser(int id, String alterName, String alterTel, String alterAddress);

    // 修改用户密码
    int updatePass(int id, String password);

    // 通过用户名查询用户
    User findUserName(String userName);

    // 验证除自己以外是否另有相同用户名
    boolean isUserNameToRemoveYourselfExist(int userSessionId, String alterName);

}
