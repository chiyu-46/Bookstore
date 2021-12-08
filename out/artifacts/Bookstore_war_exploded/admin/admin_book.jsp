<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cmn-Hans">
<head>
    <title>后台-书籍管理</title>
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
                <h1 class="h2">书籍总览</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="mr-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary" id="addBookButton">新增书籍</button>
                    </div>
                </div>
            </div>

            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">书号</th>
                    <th scope="col">书名</th>
                    <th scope="col">单价</th>
                    <th scope="col">作者</th>
                    <th scope="col">出版社</th>
                    <th scope="col">操作</th>
                </tr>
                </thead>
                <tbody id="bookList">
                    <s:iterator value="bookList">
                        <tr>
                            <th scope="row"><s:property value="bid"/></th>
                            <td><s:property value="bname"/></td>
                            <td><s:property value="price"/></td>
                            <td><s:property value="author"/></td>
                            <td><s:property value="press"/></td>
                            <td>
                                <div class="btn-group mr-2">
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="updateBookFunc(this)">修改</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="deleteBookFunc(this)">删除</button>
                                </div>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>

        </main>
    </div>
</div>

<script type="text/javascript">
    <!-- 设置左侧导航栏为正确选中项-->
    $(document).ready(function(){
        $("#book").addClass("active");
    });

    <!--对应添加按钮-->
    $("#addBookButton").click(function() {
        $("#bookList").append("<tr><th scope=\"row\"><input id='input_bid' type=\"text\" name=\"book.bid\" placeholder=\"书号\" required autofocus></th> <td><input id='input_bname' type=\"text\" name=\"book.bname\" placeholder=\"书名\" required></td> <td><input id='input_price' type=\"text\" name=\"book.price\" placeholder=\"单价\" required></td> <td><input id='input_author' type=\"text\" name=\"book.author\" placeholder=\"作者\" required></td> <td><input id='input_press' type=\"text\" name=\"book.press\" placeholder=\"出版社\" required></td> <td> <button onclick='submitBookFunc(this)' type=\"button\" class=\"btn btn-sm btn-outline-secondary deleteBookButton\">提交</button> </td></tr>");
    });

    <!--对应添加提交按钮-->
    function submitBookFunc(btn){
        $.ajax({
            url:"bookManage!addBook.action",
            type:"post",
            data:{"book.bid":$("#input_bid").val(),"book.bname":$("#input_bname").val(),"book.price":$("#input_price").val(),"book.author":$("#input_author").val(),"book.press":$("#input_press").val()},
            dataType:"text",
            error:function (){
                alert("添加成功！");
            },
            success:function (){
                alert("添加失败！");
            }
        })
    }

    <!--对应修改按钮-->
    function updateBookFunc(btn){
        alert("点击了修改按钮！");
    }

    <!--对应删除按钮-->
    function deleteBookFunc(btn){
        alert("点击了删除按钮！");
        $(btn).parents("tr").remove();
    }
</script>
</body>
</html>
