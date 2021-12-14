package com.chiyu.action.background;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Map;

@Controller
@Scope("prototype")
public class BackgroundDispatcher extends ActionSupport {
    //先确认当前用户的管理员身份是否有效。
    @Override
    public void validate() {
        Map<String, Object> session = ActionContext.getContext().getSession();
        if (session.get("isAdmin") == null){
            addFieldError("loginFall","请先登录！");
        }
    }

    //默认方法，到达后台首页。
    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    //退出登录方法。清空Session。
    public String logout(){
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.clear();
        return LOGIN;
    }

    //到达后台订单管理。
    public String toOrderManage() {
        return "toOrderManage";
    }

    //到达后台客户管理。
    public String toCustomerManage() {
        return "toCustomerManage";
    }

    //到达后台书籍管理。
    public String toBookManage() {
        return "toBookManage";
    }
}
