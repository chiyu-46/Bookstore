<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cmn-Hans">
<head>
    <title>后台-订单管理</title>
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
                <h1 class="h2">全部订单</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="mr-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary">新增订单</button>
                    </div>
                </div>
            </div>

            <table class="table table-striped">
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
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>
                        <div class="btn-group mr-2">
                            <button type="button" class="btn btn-sm btn-outline-secondary">修改</button>
                            <button type="button" class="btn btn-sm btn-outline-secondary">删除</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>


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
