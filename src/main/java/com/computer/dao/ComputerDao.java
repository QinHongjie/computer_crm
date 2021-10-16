package com.computer.dao;

import com.computer.model.Computer;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 商品 Dao 层接口
 */
public interface ComputerDao {

    /*====================================修改======================================*/
    // 修改指定商品购物率
    int updateHits(@Param("comId") int comId,@Param("hit") int hit);

    // 通过将要删除的购物车id 修改商品购物率
    int updateHitsBySCId(@Param("scid") int scid);

    /*====================================查询======================================*/
    // 查询点购率最高精选推荐商品的前4个商品
    @Select("select * from computer order by hits desc limit 0,4")
    List<Computer> findRecommComs();

    // 查询指定商品
    Computer findCom(int id);

    /**
     * 查询'全部商品' or '指定类型商品' or ‘指定数量’ or '指定范围'
     * @param type_id 类型编号
     * @param index 开始位置
     * @param num 数量
     * @return
     */
    List<Computer> findComs(@Param("type_id") String type_id, @Param("index") String index, @Param("num") String num,@Param("order") String order);

    // 查询外观系列类型 全部商品 or 指定范围、数量
    List<Computer> findWaisheComs(@Param("type_id") String type_id,@Param("index") String index,@Param("num") String num);

    // 模糊查询
    List<Computer> findComsBySearch(@Param("content") String content);

}
