package com.chiyu.service;

import com.chiyu.entity.CustomerEntity;

import java.util.List;

public interface CustomerService {
    //插入或删除一条客户信息。
    CustomerEntity insertOrUpdateCustomer(CustomerEntity customer);
    //删除一条指定id的客户信息
    void deleteCustomer(String id);
    //查找所有客户信息。
    List<CustomerEntity> findAllCustomers();
    //查找指定id的客户信息。
    CustomerEntity findCustomerById(String id);
}
