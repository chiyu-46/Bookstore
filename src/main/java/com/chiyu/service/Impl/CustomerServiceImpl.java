package com.chiyu.service.Impl;

import com.chiyu.dao.CustomerDao;
import com.chiyu.entity.CustomerEntity;
import com.chiyu.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    private CustomerDao customerDao;

    public CustomerDao getCustomerDao() {
        return customerDao;
    }

    //使用Spring Bean自动赋值
    @Autowired
    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    @Override
    public CustomerEntity insertOrUpdateCustomer(CustomerEntity customer) {
        return customerDao.save(customer);
    }

    @Override
    public void deleteCustomer(String id) {
        customerDao.deleteById(id);
    }

    @Override
    public List<CustomerEntity> findAllCustomers() {
        return customerDao.findAll();
    }

    @Override
    public CustomerEntity findCustomerById(String id) {
        return customerDao.findById(id).orElse(null);
    }
}
