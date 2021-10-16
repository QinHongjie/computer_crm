package com.computer.service.impl;

import com.computer.dao.UserDao;
import com.computer.model.User;
import com.computer.service.UserService;
import com.computer.utils.MD5Util;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 用户 Service 接口实现类
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    // 新增用户记录
    public int addUser(String username, String password, String telephone){
        password = MD5Util.getMD5(password);
        User user = new User();
        user.setUserName(username);
        user.setPassword(password);
        user.setTelephone(telephone);
        return userDao.addUser(user);
    }

    // 通过id查询用户
    @Override
    public User findUserById(int id) {
        User user = this.userDao.findUserById(id);
        return user;
    }

    // 通过用户名和密码查询用户
    @Override
    public User findUser(String userName, String password) {
        password = MD5Util.getMD5(password);//将密码进行md5加密
        User user = this.userDao.findUser(userName,password);
        return user;
    }

    // 修改用户基本信息（用户名，电话，地址）
    @Override
    public int updateUser(int id, String alterName, String alterTel, String alterAddress) {
        User user = new User();
        user.setId(id);
        user.setUserName(alterName);
        user.setTelephone(alterTel);
        user.setAddress(alterAddress);
        return userDao.updateUser(user);
    }

    // 修改用户密码
    @Override
    public int updatePass(int id, String password) {
        password = MD5Util.getMD5(password);
        return userDao.updatePass(id, password);
    }

    // 通过用户名查找用户
    @Override
    public User findUserName(String userName) {
        return userDao.findUserName(userName);
    }

    /**
     * 验证除自己以外是否另有相同用户名
     */
    public boolean isUserNameToRemoveYourselfExist(int userSessionId, String alterName) {
        // 正确或错误标识
        boolean flag = false;
        // 获取所有用户列表
        List<User> userList = userDao.findAllUser();
        //遍历集合
        for (User user : userList) {
            if(userSessionId == user.getId()){//如果是当前用户跳过比较
                continue;
            }
            if(user.getUserName().equals(alterName)){//如果另外有相同用户名则指示true
                flag = true;
                break;
            }
        }
        return flag;
    }

}
