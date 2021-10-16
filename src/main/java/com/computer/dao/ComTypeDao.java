package com.computer.dao;

import com.computer.model.ComType;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ComTypeDao {

    // 查询所有类型
    @Select("select * from comtype")
    List<ComType> findAllType();

    // 通过 id 查询类型
    @Select("select * from comtype where id=#{id}")
    ComType findType(String id);

}
