<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bookstore首页</title>
    <!-- 引入CSS样式和JS脚本文件等-->
    <%@include file="common/headContext.jsp"%>
</head>
<body>

    <!-- 引入顶部导航条-->
    <%@include file="common/common_top.jsp"%>

    <!--中部介绍区-->
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
        <h1 class="display-4">欢迎光临！</h1>
        <p class="lead">找到您想要的图书，然后将它放入购物车。您为您的订单支付后，我们将尽快安排物流配送。</p>
    </div>

    <!--商品区-->
    <div class="container">
        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <thead>
                <tr>
                    <th>书号</th>
                    <th>书名</th>
                    <th>单价</th>
                    <th>作者</th>
                    <th>出版社</th>
                    <th>加入购物车</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1,001</td>
                    <td>random</td>
                    <td>data</td>
                    <td>placeholder</td>
                    <td>text</td>
                    <td><button type="button" class="btn btn-sm btn-outline-secondary">加入</button></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
