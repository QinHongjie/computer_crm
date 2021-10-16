package com.computer.service.impl;

import com.computer.dao.ComputerDao;
import com.computer.model.Computer;
import com.computer.service.ComputerService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service("computerService")
@Transactional
public class ComputerServiceImpl implements ComputerService {

    @Autowired
    private ComputerDao computerDao;

    // 修改商品购物率
    public int updateHits(int comId, int hit){
        return this.computerDao.updateHits(comId, hit);
    }

    @Override
    public List<Computer> findRecommComs() {
        return computerDao.findRecommComs();
    }

    // 通过 id 获取商品
    @Override
    public Computer findCom(int id) {
        return this.computerDao.findCom(id);
    }

    // 查询'全部商品' or '指定类型商品' or ‘指定数量’ or '指定范围'
    @Override
    public List<Computer> findComs(String type_id, String index, String num, String order) {
        return this.computerDao.findComs(type_id, index, num, order);
    }

    // 查询外观系列类型商品
    @Override
    public List<Computer> findWaisheComs(String type_id, String index, String num) {
        return this.computerDao.findWaisheComs(type_id, index, num);
    }

    // 模糊查询
    @Override
    public List<Computer> findComsBySearch(String content) {
        return this.computerDao.findComsBySearch(content);
    }

    @Override
    public List<Computer> getPriceComs(String minPrice, String maxPrice, String type){
        // 价格查询商品容器
        List<Computer> priceComs = new ArrayList<Computer>();
        List<Computer> allComs = null;
        Computer com = new Computer();
        // 初始化最小价格
        if(minPrice==null || "".equals(minPrice)){
            minPrice = "0";
        }
        // 初始化最大价格
        if(maxPrice==null || "".equals(maxPrice)){
            maxPrice = "99999";
        }
        // 将价格字符串转化为整型 用于后续判断
        int minPriceInt = Integer.parseInt(minPrice);
        int maxPriceInt = Integer.parseInt(maxPrice);

        // 判断显示商品类型
        if (Integer.parseInt(type) < 3)
        {
            allComs = computerDao.findComs(type,"","","");
        } else
        {
            allComs = computerDao.findWaisheComs("2","","");
        }
        // 将匹配项提取出来
        for (Computer m : allComs) {
            // 字符串转换为整型 用于比较
            int price = Integer.parseInt(m.getPrice());
            // 判断价格范围是否匹配
            if(price>minPriceInt && price<maxPriceInt){
                priceComs.add(m);//匹配则提取
            }
        }
        return priceComs;
    }

}
