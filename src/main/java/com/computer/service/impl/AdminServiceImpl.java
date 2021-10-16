package com.computer.service.impl;

import com.computer.dao.UserDao;
import com.computer.model.User;
import com.computer.service.AdminService;
import com.computer.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
 * 管理员操作service层
 */
@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private UserDao userDao;

    /**
     * 通过用户名和密码查找管理员
     * @param adminName
     * @param password
     * @return
     */
    @Override
    public User findAdmin(String adminName, String password) {
        password = MD5Util.getMD5(password);
        return userDao.findAdmin(adminName, password);
    }

    @Override
    public List<User> findUserNum(int index, int num) {
        return userDao.findUserNum(index, num);
    }

    // 查询所有用户
    @Override
    public List<User> findAllUser(){
        return userDao.findAllUser();
    }

    @Override
    public int updateStatus(String id, String status) {
        return userDao.updateStatus(id, status);
    }

    @Override
    public int updateIdent(String id, String ident) {
        return userDao.updateIdent(id, ident);
    }

}
