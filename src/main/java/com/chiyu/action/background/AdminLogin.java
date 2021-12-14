package com.chiyu.action.background;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Map;

//使用注释标志此类是一个控制器Bean，类型为prototype，原型，与单例模式相反。Bean的id默认为类首字母小写。
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

    //验证用户输入的用户名与密码是否正确，不正确将返回input并返回信息：用户名或密码错误！
    @Override
    public void validate() {
        if (!(this.userName.equals("admin") && this.password.equals("123456"))){
            addFieldError("loginFall","用户名或密码错误！");
        }
    }

    //因为有前置的数据校验，到达此方法时，用户名与密码是正确的，此方法将保存“此用户是管理员”和“管理员账户名”到Session
    @Override
    public String execute() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.put("isAdmin",true);
        session.put("adminName",this.userName);
        return SUCCESS;
    }
}
