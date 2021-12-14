package com.chiyu.service;

import com.chiyu.entity.BorderitemEntity;
import com.chiyu.entity.BorderitemEntityPK;

import java.util.List;

public interface BorderitemService {
    //插入或更新一条订单项信息
    BorderitemEntity insertOrUpdateOrderItem(BorderitemEntity orderItem);

    //删除一条订单项信息
    void deleteOrderItem(BorderitemEntityPK id);

    //获取所有指定订单号订单项信息
    List<BorderitemEntity> findAllOrderItemByOid(String oid);
}
