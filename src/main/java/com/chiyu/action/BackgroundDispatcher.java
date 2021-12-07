package com.chiyu.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.Map;

@Controller
@Scope("prototype")
public class BackgroundDispatcher extends ActionSupport {
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

    //退出登录方法。
    public String logout(){
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.clear();
        return LOGIN;
    }
}
