package com.computer.dao;

import com.computer.model.ShoppingCar;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 购物车 Dao 层接口
 */
public interface ShoppingCarDao {

    /*====================================新增======================================*/
    // 通过用户id和商品id向用户购物车添加商品
    int addToSC(@Param("userId") int userId, @Param("comId") int comId, @Param("sum") int sum);

    /*====================================删除======================================*/
    // 将商品移除用户购物车
    int delUserSC(@Param("list") List<Integer> list);

    /*====================================修改======================================*/
    // 通过用户id和商品id 更新购物车商品数量
    int updateSumSC(@Param("userId") int userId, @Param("comId") int comId, @Param("sum") int sum);

    /*====================================查询======================================*/
    // 通过用户id和商品id查询购物记录
    ShoppingCar findSC(@Param("userId") int userId, @Param("comId") int comId);

    // 通过用户id 查询购物车
    List<ShoppingCar> findUserSC(@Param("userId") int userId);

    // 通过购物车id查询购物信息
    ShoppingCar findSCById(int id);

    // 查询购物车数据
    @Select("select * from shoppingcar")
    List<ShoppingCar> findAllSC();

}
