package com.chiyu.action.background;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chiyu.entity.CustomerEntity;
import com.chiyu.service.CustomerService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.UUID;

@Controller
public class CustomerManager extends ActionSupport {
    //用于获取从页面返回的客户信息。
    private CustomerEntity customer;
    private List<CustomerEntity> customerList;
    //用于对客户信息进行各种操作的服务层，由Spring Bean赋值
    private CustomerService customerService;
    //用于使用AJAX技术执行客户信息添加删除更新时向网页传递信息
    private InputStream inputStream;

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }

    public List<CustomerEntity> getCustomerList() {
        return customerList;
    }

    public void setCustomerList(List<CustomerEntity> customerList) {
        this.customerList = customerList;
    }

    public CustomerService getCustomerService() {
        return customerService;
    }

    @Autowired
    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    //访问客户信息管理页面，并返回所有客户信息。
    @Override
    public String execute() throws Exception {
        //返回所有客户信息
        customerList = customerService.findAllCustomers();
        return SUCCESS;
    }

    //添加或更新客户信息方法，使用AJAX，返回json字符串
    public String addOrUpdateCustomer(){
        if (customer.getCid() == null || customer.getCid().isEmpty()){
            customer.setCid(UUID.randomUUID().toString().replace("-", ""));
        }
        customer = customerService.insertOrUpdateCustomer(customer);
        JSONObject object = new JSONObject();
        object.put("result","操作成功");
        object.put("cid",customer.getCid());
        inputStream=new ByteArrayInputStream(JSON.toJSONString(object).getBytes(StandardCharsets.UTF_8));
        return "addOrUpdateCustomerResult";
    }

    //删除客户信息方法，使用AJAX
    public String deleteCustomer(){
        customerService.deleteCustomer(customer.getCid());
        String result = "删除成功";
        inputStream=new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
        return "deleteCustomerResult";
    }
}
