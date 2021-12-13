package com.chiyu.action.foreground;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.stereotype.Controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Map;

@Controller
public class ShoppingCart extends ActionSupport {
    //购物车信息。
    private String shoppingCartInfo;
    //用于使用AJAX技术向网页传递信息
    private InputStream inputStream;

    public String getShoppingCartInfo() {
        return shoppingCartInfo;
    }

    public void setShoppingCartInfo(String shoppingCartInfo) {
        this.shoppingCartInfo = shoppingCartInfo;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    //更新购物车Session
    public String UpdateShoppingCart(){
        System.out.println(shoppingCartInfo);
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.put("shoppingCart",shoppingCartInfo);
        inputStream=new ByteArrayInputStream("操作成功".getBytes(StandardCharsets.UTF_8));
        return "updateShoppingCartResult";
    }
}
