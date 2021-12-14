<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cmn-Hans">
<head>
    <title>后台首页</title>
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

                <h1>欢迎进入后台管理，${sessionScope.get("adminName")}!</h1>

            </main>
        </div>
    </div>
    <!-- 设置左侧导航栏为正确选中项-->
    <script type="text/javascript">
        $(document).ready(function(){
            $("#welcome").addClass("active");
        });
    </script>
</body>
</html>
