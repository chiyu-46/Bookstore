<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cmn-Hans">
<head>
    <title>后台-订单项管理</title>
    <link href="${pageContext.request.contextPath}/css/number_box.css" rel="stylesheet">
    <!-- 引入CSS样式和JS脚本文件等-->
    <%@include file="common/admin_headContext.jsp"%>
</head>
<body>
<!-- 引入顶部导航条-->
<%@include file="common/admin_common_top.jsp"%>
<div class="container-fluid">
    <div class="row">
        <!-- 引入左侧导航栏-->
        <%@include file="common/admin_common_left.jsp"%>
        <!-- 页面主体 -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">此订单内全部条目</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="mr-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary">新增条目</button>
                    </div>
                </div>
            </div>

            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">书名</th>
                    <th scope="col">数量</th>
                    <th scope="col">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>

                    <td>Mark</td>
                    <td>
                        <form id="form_1">
								<span class="number-box">
									<input type="button" class="on-number" value="减" data-v="-1">
									<input id="number_1" type="text" value="0">
									<input type="button" class="on-number" value="加" data-v="1">
								</span>
                        </form>
                    </td>
                    <td>
                        <div class="btn-group mr-2">
                            <button type="button" class="btn btn-sm btn-outline-secondary" id="submit_1">修改</button>
                            <button type="button" class="btn btn-sm btn-outline-secondary" id="del_1">删除</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>

            <script type="text/javascript">
                $(document.documentElement).on("click", ".on-number", function() {
                    var $val = $(this).siblings("input[type='text']"),
                        val = parseInt($val.val(), 10) + parseInt($(this).data("v"));
                    $val.val(isNaN(val) ? 0 : val);
                    $val.val(val<1 ? 0 : val);
                });
            </script>

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
                $("#del_1").click(function() {
                    if(confirm('确定要删除该行信息?')){
                        alert("删除！");
                    }
                    else{
                        alert("取消");
                    }
                });
            </script>

        </main>
    </div>
</div>
<!-- 设置左侧导航栏为正确选中项-->
<script type="text/javascript">
    $(document).ready(function(){
        $("#order").addClass("active");
    });
</script>
</body>
</html>
