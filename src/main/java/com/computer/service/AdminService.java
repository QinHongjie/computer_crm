package com.computer.service;


import com.computer.model.User;
import java.util.List;

/**
 * 后台管理service层接口
 */
public interface AdminService {

    // 通过用户名和密码查找有管理权限的用户
    User findAdmin(String adminName, String password);

    // 查询指定数量用户
    List<User> findUserNum(int index, int num);

    // 查询所有用户
    List<User> findAllUser();

    // 修改用户状态
    int updateStatus(String id, String status);

    // 修改用户权限
    int updateIdent(String id, String ident);

}
