package com.computer.dao;

import com.computer.model.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserDao {

    // 新增用户记录
    int addUser(User user);

    // 删除一个用户
    @Delete("delete from user where id=#{id}")
    int deleteUser(int id);

    // 修改用户记录
    int updateUser(User user);

    // 查询所有用户
    @Select("select * from user")
    List<User> getUserList();

    // 根据id查询用户
    @Select("select * from user WHERE id = #{id}")
    User getUserById(int id);

    // 通过用户名和密码查询用户
    User findUser(String userName, String password);

}
