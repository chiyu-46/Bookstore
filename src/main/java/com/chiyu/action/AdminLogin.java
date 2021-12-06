package com.chiyu.action;

import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller
@Scope("prototype")
public class AdminLogin extends ActionSupport {
    //使用属性封装获取用户登录时输入的用户名和密码。
    private String userName;
    private String password;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public void validate() {
        if (!(this.userName.equals("admin") && this.password.equals("123456"))){
            addFieldError("loginFall","用户名或密码错误！");
        }
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }
}
