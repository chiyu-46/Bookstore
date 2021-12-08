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
                <tbody>
                <tr>
                    <td>1,001</td>
                    <td>
							<span class="number-box">
								<input type="button" class="on-number" value="减" data-v="-1">
								<input id="number_1" type="text" value="0">
								<input type="button" class="on-number" value="加" data-v="1">
							</span>
                    </td>
                    <td><button type="button" class="btn btn-sm btn-outline-secondary">移出购物车</button></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="text-center">
            <div class="btn-group btn-group-lg text-center" role="group" >
                <button type="button" class="btn btn-primary btn-lg" id="submit_1">确认支付</button>
                <button type="button" class="btn btn-secondary btn-lg" id="del_1">清空购物车</button>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $("#submit_1").click(function() {
            if(isNaN($("#number_1").val())){
                alert("只能提交数字！");
            }
            else if(Number($("#number_1").val())<=0){
                alert("订购数量不能小于0！");
            }
            else{
                alert($("#number_1").val());
                $("#submit_1").submit();
            }
        });
    </script>

    <script type="text/javascript">
        $(document.documentElement).on("click", ".on-number", function() {
            var $val = $(this).siblings("input[type='text']"),
                val = parseInt($val.val(), 10) + parseInt($(this).data("v"));
            $val.val(isNaN(val) ? 0 : val);
            $val.val(val<1 ? 0 : val);
        });
    </script>

</body>
</html>
