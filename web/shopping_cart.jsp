<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <link href="${pageContext.request.contextPath}/css/number_box.css" rel="stylesheet">
    <!-- 引入CSS样式和JS脚本文件等-->
    <%@include file="common/headContext.jsp"%>
</head>
<body>

    <!-- 引入顶部导航条-->
    <%@include file="common/common_top.jsp"%>

    <!--中部介绍区-->
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
        <h1 class="display-4">购物车</h1>
        <p class="lead">这里是您的购物车。您确认支付后会生成新的订单。</p>
    </div>

    <!--商品区-->
    <div class="container">
        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <thead>
                <tr>
                    <th>书名</th>
                    <th>数量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="shoppingCartList">

                </tbody>
            </table>
        </div>

        <div class="text-center">
            <div class="btn-group btn-group-lg text-center" role="group" >
                <button type="button" class="btn btn-primary btn-lg" id="submit">确认支付</button>
                <button type="button" class="btn btn-secondary btn-lg" id="del">清空购物车</button>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function(){
            // alert("开始");
            //存储购物车信息的json字符串
            // let shoppingCart = sessionStorage.getItem('shoppingCart');
            let shoppingCart = '${sessionScope.get("shoppingCart")}';
            // alert(shoppingCart);
            // alert(shoppingCart);
            if (shoppingCart == null){
                shoppingCart = JSON.stringify([]);
                // sessionStorage.setItem('shoppingCart',shoppingCart);
            }
            sessionStorage.setItem('shoppingCart',shoppingCart);
            //从json字符串解析购物车列表
            let shoppingCartList = JSON.parse(shoppingCart);
            // alert(shoppingCartList);
            //多次加入同一书籍
            for (let i = 0; i < shoppingCartList.length; i++){
                // alert(shoppingCartList[i][1]);
                $("#shoppingCartList").append("<tr><th scope='row' style='display:none;'>" + shoppingCartList[i][0] + "</th> <td>" + shoppingCartList[i][1] + "</td> <td><input id='input_bid' type=\"text\" onblur='checkValueIsNumber(this)' value=" + shoppingCartList[i][2] + " >" + "</td> <td> <button type='button' class='tn btn-sm btn-outline-secondary' onclick='removeFromShoppingCart(this)'>移出购物车</button> </td></tr>");
            }
        });

        <!--用户输入后失去焦点，检查输入内容是否为数字，不是则重置为1-->
        function checkValueIsNumber(input){
            let value = $(input).val();
            if(isNaN(value)){
                alert("只能提交数字！");
                $(input).val(1);
            }
            else if(Number(value)<=0){
                alert("订购数量不能小于0！");
                $(input).val(1);
            }
        }

        <!--移出购物车-->
        function removeFromShoppingCart(btn){
            // alert("点击了移出按钮");
            let item = $(btn).parent("td").siblings("th");
            //防止多次提交
            $(btn).attr("disabled",true);
            let bid = item.text();
            // alert(bid);
            let shoppingCart = sessionStorage.getItem('shoppingCart');
            //从json字符串解析购物车列表
            let shoppingCartList = JSON.parse(shoppingCart);
            // alert(shoppingCartList);
            for (let i = 0; i < shoppingCartList.length; i++){
                // alert(shoppingCartList[i][1]);
                if (shoppingCartList[i][0] === bid){
                    // alert("成功");
                    shoppingCartList.splice(i,1);
                    break;
                }
            }
            sessionStorage.setItem('shoppingCart',JSON.stringify(shoppingCartList));
            $.ajax({
                url:"shoppingCart!UpdateShoppingCart.action",
                type:"post",
                data:{"shoppingCartInfo":sessionStorage.getItem('shoppingCart')},
                dataType:"text",
                error:function (){
                    // alert("操作失败！");
                },
                success:function (data){
                    // alert(data);
                    if (data === "操作成功"){
                        $(btn).parent("td").parents("tr").remove();
                    }
                }
            })
        }

        <!--确认支付-->
        $("#submit").click(function() {
            // alert("点击了确认支付");
            sessionStorage.setItem('shoppingCart',JSON.stringify([]));
            $.ajax({
                url:"orderForCustomer!addOrder.action",
                type:"post",
                data:{},
                dataType:"text",
                error:function (){
                    // alert("操作失败！");
                },
                success:function (data){
                    // alert(data);
                    if (data === "操作成功"){
                        $("#shoppingCartList").text('');
                    }
                }
            })
        });

        <!--清空购物车-->
        $("#del").click(function() {
            sessionStorage.setItem('shoppingCart',JSON.stringify([]));
            $.ajax({
                url:"shoppingCart!UpdateShoppingCart.action",
                type:"post",
                data:{"shoppingCartInfo":sessionStorage.getItem('shoppingCart')},
                dataType:"text",
                error:function (){
                    // alert("操作失败！");
                },
                success:function (data){
                    // alert(data);
                    if (data === "操作成功"){
                        $("#shoppingCartList").text('');
                    }
                }
            })
            // alert("点击了清空购物车");
        });
    </script>

</body>
</html>
