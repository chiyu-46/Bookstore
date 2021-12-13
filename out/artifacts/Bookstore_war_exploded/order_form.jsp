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
                    <th>订单号</th>
                    <th>创建时间</th>
                    <th>收货地址</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1,001</td>
                    <td>random</td>
                    <td>data</td>
                    <td>
                        <button type="button" class="btn btn-primary btn-sm">备货中</button>
                        <button type="button" class="btn btn-warning btn-sm">运输中</button>
                        <button type="button" class="btn btn-success btn-sm">已完成</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        $("#toShoppingCart").click(function sentShoppingCart(){
            window.location.href="${pageContext.request.contextPath}/dispatcher!toShoppingCart.action";
        })
    </script>
</body>
</html>
