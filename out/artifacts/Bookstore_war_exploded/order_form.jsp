<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的订单</title>
    <!-- 引入CSS样式和JS脚本文件等-->
    <%@include file="common/headContext.jsp"%>
</head>
<body>

    <!-- 引入顶部导航条-->
    <%@include file="common/common_top.jsp"%>

    <!--中部介绍区-->
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
        <h1 class="display-4">全部订单</h1>
        <p class="lead">这里是您在本书店下的所有订单，您可以在这里查看订单的状态。点击一个订单，您可以查看订单内容。</p>
    </div>

    <!--商品区-->
    <div class="container">
        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th scope="col">订单号</th>
                        <th scope="col">客户号</th>
                        <th scope="col">下单时间</th>
                        <th scope="col">状态</th>
                        <th scope="col">收货人</th>
                        <th scope="col">收货地址</th>
                        <th scope="col">电话</th>
                        <th scope="col">操作</th>
                    </tr>
                </thead>
                <tbody id="orderList">
                    <s:iterator value="orderList">
                        <tr>
                            <th scope="row"><s:property value="oid"/></th>
                            <td><s:property value="cid"/></td>
                            <td><s:property value="otime"/></td>
                            <td><s:property value="ostate"/></td>
                            <td><s:property value="receptor"/></td>
                            <td><s:property value="address"/></td>
                            <td><s:property value="phone"/></td>
                            <td>
                                <div class="btn-group mr-2">
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="checkOrderFunc(this)">详情</button>
                                </div>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        $("#toShoppingCart").click(function sentShoppingCart(){
            window.location.href="${pageContext.request.contextPath}/dispatcher!toShoppingCart.action";
        })

        <!--对应详情按钮-->
        function checkOrderFunc(btn){
            //防止多次提交
            $(btn).attr("disabled",true);
            let item = $(btn).parents("div").parent("td").siblings("th");
            let oid = item.text();
            window.location.href="orderForCustomer!toOrderItem.action?oid=" + oid;
        }
    </script>
</body>
</html>
