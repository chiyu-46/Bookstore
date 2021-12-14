package com.chiyu.action.foreground;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chiyu.entity.BorderEntity;
import com.chiyu.entity.BorderitemEntity;
import com.chiyu.service.BorderService;
import com.chiyu.service.BorderitemService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class OrderForCustomer extends ActionSupport {
    //用于与前端页面传递订单信息。
    private BorderEntity order;
    private List<BorderEntity> orderList;
    //用于对订单信息进行各种操作的服务层，由Spring Bean赋值
    private BorderService orderService;
    //用于与前端页面传递订单项信息。
    private BorderitemEntity orderItem;
    private List<BorderitemEntity> orderItemList;
    //用于对订单项信息进行各种操作的服务层，由Spring Bean赋值
    private BorderitemService orderItemService;
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

    public BorderitemEntity getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(BorderitemEntity orderItem) {
        this.orderItem = orderItem;
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

    //访问用户订单页面，并返回所有指定用户订单信息。
    public String toOrder() throws Exception {
        //查找用户订单信息。
        Map<String, Object> session = ActionContext.getContext().getSession();
        String cid = (String) session.get("cid");
        orderList = orderService.findBorderEntitiesByCid(cid);
        return "toOrder";
    }

    //访问订单项信息页面，并返回所有指定订单号的订单项信息。
    public String toOrderItem() throws Exception {
        //从 request 获取 get 请求中的 订单号
        HttpServletRequest request = ServletActionContext.getRequest();
        String oidOfOrderItems = request.getParameter("oid");
        //返回所有指定订单号的订单项信息
        orderItemList = orderItemService.findAllOrderItemByOid(oidOfOrderItems);
        return "toOrderItem";
    }

    //添加订单。
    public String addOrder(){
        Map<String, Object> session = ActionContext.getContext().getSession();
        String shoppingCartInfo = (String) session.get("shoppingCart");
        order = new BorderEntity();
        order.setOid(UUID.randomUUID().toString().replace("-", ""));
        order.setCid((String) session.get("cid"));
        order.setReceptor((String) session.get("name"));
        order.setPhone((String) session.get("phone"));
        order.setAddress((String) session.get("address"));
        order.setOstate("已下单");
        orderService.insertOrUpdateBorder(order);
        JSONArray shoppingCartList = JSONArray.parseArray(shoppingCartInfo);
        orderItem = new BorderitemEntity();
        orderItem.setOid(order.getOid());
        for (int i = 0; i < shoppingCartList.size(); i++){
            JSONArray listItem = (JSONArray) shoppingCartList.get(i);
            orderItem.setBid((String) listItem.get(0));
            orderItem.setQuantity((Integer) listItem.get(2));
            orderItemService.insertOrUpdateOrderItem(orderItem);
        }
        session.put("shoppingCart","[]");
        inputStream=new ByteArrayInputStream("操作成功".getBytes(StandardCharsets.UTF_8));
        return "addOrderResult";
    }
}
