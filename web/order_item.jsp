<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单详情</title>
    <!-- 引入CSS样式和JS脚本文件等-->
    <%@include file="common/headContext.jsp"%>
</head>
<body>

    <!-- 引入顶部导航条-->
    <%@include file="common/common_top.jsp"%>

    <!--中部介绍区-->
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
        <h1 class="display-4">订单内容</h1>
        <p class="lead">这里显示的是您点击的订单的具体内容。</p>
    </div>

    <!--商品区-->
    <div class="container">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">书号</th>
                    <th scope="col">数量</th>
                </tr>
                </thead>
                <tbody id="orderItemList">
                <s:iterator value="orderItemList">
                    <tr>
                        <th scope="row"><s:property value="bid"/></th>
                        <td><s:property value="quantity"/></td>
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
    </script>
</body>
</html>
