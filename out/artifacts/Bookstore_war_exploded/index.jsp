<%@ taglib prefix="s" uri="/struts-tags" %>
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
        <h1 class="display-4">欢迎光临，${sessionScope.get("name")}！</h1>
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
                    <s:iterator value="bookList">
                        <tr>
                            <th scope="row"><s:property value="bid"/></th>
                            <td><s:property value="bname"/></td>
                            <td><s:property value="price"/></td>
                            <td><s:property value="author"/></td>
                            <td><s:property value="press"/></td>
                            <td><button type="button" class="btn btn-sm btn-outline-secondary" onclick="addToShoppingCart(this)">加入</button></td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        <!--对应加入按钮-->
        function addToShoppingCart(btn){
            let item = $(btn).parent("td").siblings("th");
            let bid = item.text();
            let bname = item.next().text();
            //存储购物车信息的json字符串
            let shoppingCart = sessionStorage.getItem('shoppingCart');
            alert(shoppingCart);
            if (shoppingCart == null){
                shoppingCart = JSON.stringify([]);
                sessionStorage.setItem('shoppingCart',shoppingCart);
            }
            //从json字符串解析购物车列表
            let shoppingCartList = JSON.parse(shoppingCart);
            //多次加入同一书籍
            for (let i = 0; i < shoppingCartList.length; i++){
                if (shoppingCartList[i][0] === bid){
                    shoppingCartList[i][2] = ++shoppingCartList[i][2];
                    sessionStorage.setItem('shoppingCart',JSON.stringify(shoppingCartList));
                    alert("添加成功！");
                    return;
                }
            }
            //将要加入购物车的项
            let listItem = [bid,bname,1];
            shoppingCartList.push(listItem);
            sessionStorage.setItem('shoppingCart',JSON.stringify(shoppingCartList));
            alert("添加成功！");
        }

        $("#toShoppingCart").click(function sentShoppingCart(){
            $.ajax({
                url:"shoppingCart!UpdateShoppingCart.action",
                type:"post",
                data:{"shoppingCartInfo":sessionStorage.getItem('shoppingCart')},
                dataType:"text",
                error:function (){
                    alert("操作失败！");
                },
                success:function (data){
                    alert(data);
                    if (data === "操作成功"){
                        //
                    }
                }
            })
            window.location.href="${pageContext.request.contextPath}/dispatcher!toShoppingCart.action";
        })
    </script>
</body>
</html>
