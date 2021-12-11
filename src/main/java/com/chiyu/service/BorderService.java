package com.chiyu.service;

import com.chiyu.entity.BorderEntity;

import java.util.List;

public interface BorderService {
    //插入或更新一条订单信息
    BorderEntity insertOrUpdateBorder(BorderEntity order);

    //删除一条订单信息
    void deleteBorder(String id);

    //获取所有订单信息
    List<BorderEntity> findAllBorders();

    //寻找指定订单号的订单信息
    BorderEntity findBorderById(String id);
}
