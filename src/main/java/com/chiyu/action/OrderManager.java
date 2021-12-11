package com.chiyu.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chiyu.entity.BorderEntity;
import com.chiyu.service.BorderService;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.UUID;

@Controller
public class OrderManager extends ActionSupport {
    //用于与前端页面传递订单信息。
    private BorderEntity order;
    private List<BorderEntity> orderList;
    //用于对订单信息进行各种操作的服务层，由Spring Bean赋值
    private BorderService orderService;
    //用于使用AJAX技术执行订单信息添加删除更新时向网页传递信息
    private InputStream inputStream;

    public BorderEntity getOrder() {
        return order;
    }

    public void setOrder(BorderEntity order) {
        this.order = order;
    }

    public List<BorderEntity> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<BorderEntity> orderList) {
        this.orderList = orderList;
    }

    public BorderService getOrderService() {
        return orderService;
    }

    @Autowired
    public void setOrderService(BorderService orderService) {
        this.orderService = orderService;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    //访问订单信息管理页面，并返回所有订单信息。
    @Override
    public String execute() throws Exception {
        //返回所有订单信息
        orderList = orderService.findAllBorders();
        return SUCCESS;
    }

    //添加或更新订单信息方法，使用AJAX，返回json字符串
    public String addOrUpdateCustomer(){
        if (order.getOid() == null || order.getOid().isEmpty()){
            order.setOid(UUID.randomUUID().toString().replace("-", ""));
            //TODO:设置时间戳
            order.setOstate("已下单");
        }
        order = orderService.insertOrUpdateBorder(order);
        JSONObject object = new JSONObject();
        object.put("result","操作成功");
        object.put("cid",order.getCid());
        inputStream=new ByteArrayInputStream(JSON.toJSONString(object).getBytes(StandardCharsets.UTF_8));
        return "addOrUpdateCustomerResult";
    }

    //删除订单信息方法，使用AJAX
    public String deleteCustomer(){
        orderService.deleteBorder(order.getCid());
        String result = "删除成功";
        inputStream=new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
        return "deleteCustomerResult";
    }
}
