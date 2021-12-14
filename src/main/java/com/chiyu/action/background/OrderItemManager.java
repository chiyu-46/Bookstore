package com.chiyu.action.background;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chiyu.entity.BorderitemEntity;
import com.chiyu.entity.BorderitemEntityPK;
import com.chiyu.service.BorderitemService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.UUID;

@Controller
public class OrderItemManager extends ActionSupport {
    //用于与前端页面传递订单项信息。
    private BorderitemEntity orderItem;
    private String oidOfOrderItems;
    private List<BorderitemEntity> orderItemList;
    //用于对订单项信息进行各种操作的服务层，由Spring Bean赋值
    private BorderitemService orderItemService;
    //用于使用AJAX技术执行订单项信息添加删除更新时向网页传递信息
    private InputStream inputStream;

    public BorderitemEntity getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(BorderitemEntity orderItem) {
        this.orderItem = orderItem;
    }

    public String getOidOfOrderItems() {
        return oidOfOrderItems;
    }

    public void setOidOfOrderItems(String oidOfOrderItems) {
        this.oidOfOrderItems = oidOfOrderItems;
    }

    public List<BorderitemEntity> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<BorderitemEntity> orderItemList) {
        this.orderItemList = orderItemList;
    }

    public BorderitemService getOrderItemService() {
        return orderItemService;
    }

    @Autowired
    public void setOrderItemService(BorderitemService orderItemService) {
        this.orderItemService = orderItemService;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    //访问订单项信息管理页面，并返回所有指定订单号的订单项信息。
    @Override
    public String execute() throws Exception {
        //从 request 获取 get 请求中的 订单号
        HttpServletRequest request = ServletActionContext.getRequest();
        oidOfOrderItems = request.getParameter("oid");
        //返回所有指定订单号的订单项信息
        orderItemList = orderItemService.findAllOrderItemByOid(oidOfOrderItems);
        return SUCCESS;
    }

    //添加或更新订单项信息方法，使用AJAX，返回json字符串
    public String addOrUpdateOrderItem(){
        orderItem = orderItemService.insertOrUpdateOrderItem(orderItem);
        JSONObject object = new JSONObject();
        object.put("result","操作成功");
        inputStream=new ByteArrayInputStream(JSON.toJSONString(object).getBytes(StandardCharsets.UTF_8));
        return "addOrUpdateOrderItemResult";
    }

    //删除订单项信息方法，使用AJAX
    public String deleteOrderItem(){
        BorderitemEntityPK borderitemEntityPK = new BorderitemEntityPK(orderItem.getOid(),orderItem.getBid());
        orderItemService.deleteOrderItem(borderitemEntityPK);
        String result = "删除成功";
        inputStream=new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
        return "deleteOrderItemResult";
    }
}
