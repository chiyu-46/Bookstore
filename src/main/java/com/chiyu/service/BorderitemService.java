package com.chiyu.service;

import com.chiyu.entity.BorderitemEntity;
import com.chiyu.entity.BorderitemEntityPK;

import java.util.List;

public interface BorderitemService {
    //插入或更新一条订单项信息
    BorderitemEntity insertOrUpdateBook(BorderitemEntity orderitem);

    //删除一条订单项信息
    void deleteBook(BorderitemEntityPK id);

    //获取所有订单项信息
    List<BorderitemEntity> findAllBooks();

    //寻找指定订单号和书号的订单项信息
    BorderitemEntity findBookById(BorderitemEntityPK id);
}
