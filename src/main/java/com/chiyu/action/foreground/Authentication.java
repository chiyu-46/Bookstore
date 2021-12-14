package com.chiyu.action.foreground;

import com.chiyu.entity.CustomerEntity;
import com.chiyu.service.CustomerService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

//用于实现登录注册功能
@Controller
public class Authentication extends ActionSupport {
    //用于接收登录用户名，密码或者注册时的用户信息。
    private CustomerEntity user;
    //用于对用户信息进行持久化操作
    private CustomerService customerService;
    //用于使用AJAX技术向网页传递信息
    private InputStream inputStream;

    public CustomerEntity getUser() {
        return user;
    }

    public void setUser(CustomerEntity user) {
        this.user = user;
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

    //登录成功后，将用户信息保存到Session
    private void saveToSession(){
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.put("cid",user.getCid());
        session.put("name",user.getCname());
        session.put("address",user.getAddress());
        session.put("phone",user.getPhone());
    }

    public String login(){
        List<CustomerEntity> result = customerService.findByCnameAndPassword(user.getCname(), user.getPassword());
        if (result.size() == 0){
            addFieldError("loginFall","用户名或密码错误！");
            return INPUT;
        }
        user = result.get(0);
        saveToSession();
        return SUCCESS;
    }

    //转到注册页面
    public String toRegister(){
        return "register";
    }

    public String register(){
        //检查当前用户名与密码的组合是否存在
        List<CustomerEntity> result = customerService.findByCnameAndPassword(user.getCname(), user.getPassword());
        if (result.size() > 0){
            addFieldError("loginFall","请尝试其他用户名和密码！");
            return INPUT;
        }
        user.setCid(UUID.randomUUID().toString().replace("-", ""));
        customerService.insertOrUpdateCustomer(user);
        saveToSession();
        return SUCCESS;
    }
}
