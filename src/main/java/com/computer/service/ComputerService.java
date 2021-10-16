package com.computer.service;

import com.computer.model.Computer;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 商品 Service 层接口
 */
public interface ComputerService {

    // 修改商品购物率
    int updateHits(int comId, int hit);

    // 查询点购率最高精选推荐商品的前4个商品
    List<Computer> findRecommComs();

    // 通过 id 查询商品
    Computer findCom(int id);

    // 查询'全部商品' or '指定类型商品' or ‘指定数量’ or '指定范围'
    List<Computer> findComs(String type_id, String index, String num, String order);

    // 查询外观系列类型商品
    List<Computer> findWaisheComs(String type_id, String index, String num);

    // 模糊查询
    List<Computer> findComsBySearch(String content);

    List<Computer> getPriceComs(String minPrice, String maxPrice, String type);

}
