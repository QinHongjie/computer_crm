package com.computer.service;

import com.computer.model.ShoppingCar;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 购物车 Service 层接口
 */
public interface ShoppingCarService {

    // 通过用户id和商品id向用户购物车添加商品
    int addToSC(int userId, int comId, int sum);

    // 将商品移除用户购物车
    int delUserSC(List<Integer> ids);

    // 通过用户id 查询购物车
    List<ShoppingCar> findUserSC(int userId);

    // 通过购物车id查询购物信息
    ShoppingCar findSCById(int id);

    // 查询购物车数据
    List<ShoppingCar> findAllSC();

}
