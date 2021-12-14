<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bookstore首页</title>
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .container {
            max-width: 960px;
        }

        .lh-condensed {
            line-height: 1.25;
        }
    </style>

</head>
<body class="bg-light">

<div class="container">
    <!--顶部文字-->
    <div class="py-5 text-center">
        <h2>新用户注册</h2>
        <p class="lead">请用心填写以下信息，然后点击注册，之后我们将为您分配用户口令。</p>
    </div>

    <!--主体部分-->
    <div class="row">
        <div class="col-md-12 order-md-1">
            <h4 class="mb-3">用户信息</h4>
            <form action="authentication!register.action" method="post">
                <div class="form-group">
                    <s:fielderror fieldName="loginFall"/>
                </div>
                <div class="mb-3">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control" id="username" name="user.cname" placeholder="Username" required>
                </div>

                <div class="mb-3">
                    <label for="phone">电话</label>
                    <input type="tel" class="form-control" id="phone" name="user.phone" placeholder="177********">
                </div>

                <div class="mb-3">
                    <label for="address">地址</label>
                    <input type="text" class="form-control" id="address" name="user.address" placeholder="**省**市**区**小区**栋**室" required>
                </div>

                <div class="mb-3">
                    <label for="password">密码</label>
                    <input type="text" class="form-control" id="password" name="user.password" placeholder="**省**市**区**小区**栋**室" required>
                </div>

                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">注册</button>
            </form>
        </div>


    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1"> </p>
    </footer>
</div>

</body>
</html>
