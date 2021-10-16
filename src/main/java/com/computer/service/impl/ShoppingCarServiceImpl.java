package com.computer.service.impl;

import com.computer.dao.ComputerDao;
import com.computer.dao.ShoppingCarDao;
import com.computer.model.ShoppingCar;
import com.computer.service.ShoppingCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 购物车 Service 接口实现类
 */
@Service("shoppingCarService")
@Transactional
public class ShoppingCarServiceImpl implements ShoppingCarService {

    @Autowired
    private ShoppingCarDao shoppingCarDao;
    @Autowired
    private ComputerDao computerDao;

    // 通过用户id和商品id向用户购物车添加商品
    @Override
    public int addToSC(int userId, int comId, int sum){
        int r = 0;
        try{
            ShoppingCar shoppingCar = shoppingCarDao.findSC(userId,comId);
            if(shoppingCar != null){// 如果已有订单记录，则增加购买数量
                r += shoppingCarDao.updateSumSC(userId, comId, sum);
            } else {// 如果没有订单记录，则添加
                r += shoppingCarDao.addToSC(userId, comId, sum);
            }
            computerDao.updateHits(comId, sum);
        }catch (Exception e){
            e.printStackTrace();
        }
        return r;
    }

    // 将商品移除用户购物车
    @Override
    public int delUserSC(List<Integer> ids){
        int r=0;
        try{
            for (Integer id: ids) {
                computerDao.updateHitsBySCId(id);
            }
            r += shoppingCarDao.delUserSC(ids);
        }catch (Exception e){
            e.printStackTrace();
        }
        return r;// 返回删除数量
    }

    // 通过用户id查询购物车数据
    @Override
    public List<ShoppingCar> findUserSC(int userId) {
        return this.shoppingCarDao.findUserSC(userId);
    }

    // 通过购物车id查询购物信息
    @Override
    public ShoppingCar findSCById(int id) {
        return this.shoppingCarDao.findSCById(id);
    }

    // 查询所有购物信息
    @Override
    public List<ShoppingCar> findAllSC() {
        return this.shoppingCarDao.findAllSC();
    }
}
