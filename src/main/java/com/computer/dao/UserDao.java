package com.computer.dao;

import com.computer.model.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 用户 Dao 层接口
 */
public interface UserDao {

    /*====================================新增======================================*/
    // 新增用户记录
    int addUser(User user);

    /*====================================删除======================================*/
    // 删除一个用户
    @Delete("delete from user where id=#{id}")
    int deleteUser(int id);

    /*====================================修改======================================*/
    // 修改用户记录
    int updateUser(User user);

    // 修改用户密码
    int updatePass(@Param("id") int id, @Param("password") String password);

    // 修改用户状态
    int updateStatus(@Param("id") String id, @Param("status") String status);

    // 修改用户权限
    int updateIdent(@Param("id") String id, @Param("ident") String ident);

    /*====================================查询======================================*/
    // 查询所有用户
    @Select("select * from user")
    List<User> findAllUser();

    // 查询指定数量用户
    @Select("select * from user limit #{index},#{num}")
    List<User> findUserNum(@Param("index") int index, @Param("num") int num);

    // 根据id查询用户
    @Select("select * from user where id = #{id}")
    User findUserById(int id);

    // 通过用户名查询用户
    @Select("select * from user where userName = #{userName}")
    User findUserName(@Param("userName") String userName);

    // 通过用户名和密码查询用户
    User findUser(@Param("userName") String userName, @Param("password") String password);

    // 通过用户名和密码查询有管理权限用户
    User findAdmin(@Param("userName") String userName, @Param("password") String password);

}
