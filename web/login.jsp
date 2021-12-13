<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <title>登录</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style type="text/css">
        /*垂直居中，div上边界距离窗口上边的距离为窗口高度的50%，
        实际上此时div内容整体已经偏下，再把整个身子往上移动一半即可
        并针对不同浏览器进行兼容。
        */
        .col-center-block {
            position: absolute;
            top: 50%;
            -webkit-transform: translateY(-50%);
            -moz-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            -o-transform: translateY(-50%);
            transform: translateY(-50%);
        }

    </style>
</head>
<body>

<!-- 在外层添加一个div，把行内容居中，添加.row .justify-content-center -->
<div class="row justify-content-center ">
    <div class="col-sm-3 card border-dark card text-center col-center-block shadow-lg" style="
			padding-right: 0px;
			padding-left: 0px;
			min-width: 20rem;">
        <div class="card-header">登录</div>
        <div class="card-body text-dark">

            <form action="authentication!login.action" method="post">
                <div class="form-group">
                    <s:fielderror fieldName="loginFall"/>
                </div>
                <div class="form-group">
                    <label for="userName" class="sr-only">Email address</label>
                    <input type="text" class="form-control" id="userName"  name="user.cname" placeholder="用户名" required autofocus>
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" class="form-control" id="password"  name="user.password" placeholder="口令" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">登录</button>
            </form>
        </div>
        <div>或者</div>
        <div class="card-body text-dark">
            <a class="btn btn-primary btn-block" href="authentication!toRegister.action">注册</a>
        </div>
    </div>

</body>
</html>