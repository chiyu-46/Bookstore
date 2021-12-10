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
        $("#bookList").append("<tr id='newLine'><th scope=\"row\"><input id='input_bid' type=\"text\" name=\"book.bid\" placeholder=\"书号\" required autofocus></th> <td><input id='input_bname' type=\"text\" name=\"book.bname\" placeholder=\"书名\" required></td> <td><input id='input_price' type=\"text\" name=\"book.price\" placeholder=\"单价\" required></td> <td><input id='input_author' type=\"text\" name=\"book.author\" placeholder=\"作者\" required></td> <td><input id='input_press' type=\"text\" name=\"book.press\" placeholder=\"出版社\" required></td> <td> <button onclick='submitBookFunc(this)' type=\"button\" class=\"btn btn-sm btn-outline-secondary deleteBookButton\">提交</button> </td></tr>");
        //只有在一条新记录提交完成后，才能创建下一条新的记录。
        $(this).attr("disabled",true);
    });

    <!--对应提交按钮-->
    function submitBookFunc(btn){
        //防止多次提交
        $(btn).attr("disabled",true);
        let bid = $("#input_bid").val();
        let bname = $("#input_bname").val();
        let price = $("#input_price").val();
        let author = $("#input_author").val();
        let press = $("#input_press").val();
        $.ajax({
            url:"bookManager!addOrUpdateBook.action",
            type:"post",
            data:{"book.bid":bid,"book.bname":bname,"book.price":price,"book.author":author,"book.press":press},
            dataType:"text",
            error:function (){
                alert("操作失败！");
            },
            success:function (data){
                alert(data);
                if (data === "操作成功"){
                    //只有在一条新记录提交完成后，才能创建下一条新的记录。
                    $("#addBookButton").attr("disabled",false);
                    $("#newLine").remove();
                    $("#bookList").append("<tr><th scope='row'>" + bid+ "</th> <td>" + bname + "</td> <td>" + price + "</td> <td>" + author + "</td> <td>" + press + "</td> <td> <div class='btn-group mr-2'> <button type='button' class='btn btn-sm btn-outline-secondary' onclick='updateBookFunc(this)'>修改</button><button type='button' class='btn btn-sm btn-outline-secondary' onclick='deleteBookFunc(this)'>删除</button></div></td></tr>'");
                }
            }
        })
    }

    <!--对应修改按钮-->
    function updateBookFunc(btn){
        let item = $(btn).parents("div").parent("td").siblings("th");
        //防止多次提交
        $(btn).attr("disabled",true);
        let bid = item.text();
        let bname = item.next().text();
        let price = item.next().next().text();
        let author = item.next().next().next().text();
        let press = item.next().next().next().next().text();
        item.parents("tr").remove();
        $("#bookList").append("<tr id='newLine'><th scope=\"row\"><input id='input_bid' type=\"text\" name=\"book.bid\" value=" + bid + " required disabled></th> <td><input id='input_bname' type=\"text\" name=\"book.bname\" value=" + bname + " required></td> <td><input id='input_price' type=\"text\" name=\"book.price\" value=" + price + " required></td> <td><input id='input_author' type=\"text\" name=\"book.author\" value=" + author + " required></td> <td><input id='input_press' type=\"text\" name=\"book.press\" value=" + press + " required></td> <td> <button onclick='submitBookFunc(this)' type=\"button\" class=\"btn btn-sm btn-outline-secondary deleteBookButton\">提交</button> </td></tr>");
    }

    <!--对应删除按钮-->
    function deleteBookFunc(btn){
        if(confirm('确定要删除该行信息?')){
            let item = $(btn).parents("div").parent("td").siblings("th");
            //防止多次提交
            $(btn).attr("disabled",true);
            let bid = item.text();
            $.ajax({
                url:"bookManager!deleteBook.action",
                type:"post",
                data:{"book.bid":bid},
                dataType:"text",
                error:function (){
                    alert("删除失败！");
                },
                success:function (data){
                    alert(data);
                    if (data === "删除成功"){
                        $(btn).parents("tr").remove();
                    }else {
                        $(btn).attr("disabled",false);
                    }
                }
            })
        }
    }
</script>
</body>
</html>
