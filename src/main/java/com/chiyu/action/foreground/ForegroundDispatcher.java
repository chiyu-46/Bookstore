package com.chiyu.action.foreground;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.stereotype.Controller;

import java.util.Map;

@Controller
public class ForegroundDispatcher extends ActionSupport {
    //先确认当前用户的身份是否有效。
    public boolean isLoggedIn() {
        Map<String, Object> session = ActionContext.getContext().getSession();
        return session.get("name") != null;
    }

    //默认方法，到达首页。
    @Override
    public String execute() throws Exception {
        if (isLoggedIn()){
            return SUCCESS;
        }else {
            return INPUT;
        }
    }

    //退出登录方法。清空Session。
    public String logout(){
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.clear();
        return LOGIN;
    }

    //到达我的购物车。
    public String toShoppingCart() {
        if (isLoggedIn()){
            return "toShoppingCart";
        }else {
            return INPUT;
        }
    }

    //到达我的订单。
    public String toOrder() {
        if (isLoggedIn()){
            return "toOrder";
        }else {
            return INPUT;
        }
    }
}
