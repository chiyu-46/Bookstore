<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-cmn-Hans">
<head>
    <title>后台-客户管理</title>
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
                <h1 class="h2">全部客户</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="mr-2">
                        <button type="button" class="btn btn-sm btn-outline-secondary" id="addCustomerButton">新增客户</button>
                    </div>
                </div>
            </div>

            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">客户号</th>
                    <th scope="col">客户名</th>
                    <th scope="col">电话</th>
                    <th scope="col">地址</th>
                    <th scope="col">密码</th>
                    <th scope="col">操作</th>
                </tr>
                </thead>
                <tbody id="customerList">
                    <s:iterator value="customerList">
                        <tr>
                            <th scope="row"><s:property value="cid"/></th>
                            <td><s:property value="cname"/></td>
                            <td><s:property value="phone"/></td>
                            <td><s:property value="address"/></td>
                            <td><s:property value="password"/></td>
                            <td>
                                <div class="btn-group mr-2">
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="updateCustomerFunc(this)">修改</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="deleteCustomerFunc(this)">删除</button>
                                </div>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>

        </main>
    </div>
</div>
<!-- 设置左侧导航栏为正确选中项-->
<script type="text/javascript">
    $(document).ready(function(){
        $("#customer").addClass("active");
    });

    <!--对应添加按钮-->
    $("#addCustomerButton").click(function() {
        $("#customerList").append("<tr id='newLine'><th scope=\"row\"><input id='input_cid' type=\"text\" name=\"customer.cid\" placeholder=\"客户号\" required autofocus></th> <td><input id='input_cname' type=\"text\" name=\"customer.cname\" placeholder=\"客户名\" required></td> <td><input id='input_phone' type=\"text\" name=\"customer.phone\" placeholder=\"电话\" required></td> <td><input id='input_address' type=\"text\" name=\"customer.address\" placeholder=\"地址\" required></td> <td><input id='input_password' type=\"text\" name=\"customer.password\" placeholder=\"密码\" required></td> <td> <button onclick='submitCustomerFunc(this)' type=\"button\" class=\"btn btn-sm btn-outline-secondary\">提交</button> </td></tr>");
        //只有在一条新记录提交完成后，才能创建下一条新的记录。
        $(this).attr("disabled",true);
    });

    <!--对应提交按钮-->
    function submitCustomerFunc(btn){
        //防止多次提交
        $(btn).attr("disabled",true);
        let cid = $("#input_cid").val();
        let cname = $("#input_cname").val();
        let phone = $("#input_phone").val();
        let address = $("#input_address").val();
        let password = $("#input_password").val();
        $.ajax({
            url:"customerManager!addOrUpdateCustomer.action",
            type:"post",
            data:{"customer.cid":cid,"customer.cname":cname,"customer.phone":phone,"customer.address":address,"customer.password":password},
            dataType:"text",
            error:function (){
                alert("操作失败！");
                //可以再次尝试提交
                $(btn).attr("disabled",false);
            },
            success:function (data){
                //alert(data);
                // 将json字符串转化为json对象
                let obj = jQuery.parseJSON(data);
                if (obj.result === "操作成功"){
                    alert(obj.result);
                    cid = obj.cid;
                    //只有在一条新记录提交完成后，才能创建下一条新的记录。
                    $("#addCustomerButton").attr("disabled",false);
                    $("#newLine").remove();
                    $("#customerList").append("<tr><th scope='row'>" + cid + "</th> <td>" + cname + "</td> <td>" + phone + "</td> <td>" + address + "</td> <td>" + password + "</td> <td> <div class='btn-group mr-2'> <button type='button' class='btn btn-sm btn-outline-secondary' onclick='updateCustomerFunc(this)'>修改</button><button type='button' class='btn btn-sm btn-outline-secondary' onclick='deleteCustomerFunc(this)'>删除</button></div></td></tr>'");
                }else {
                    //可以再次尝试提交
                    $(btn).attr("disabled",false);
                }
            }
        })
    }

    <!--对应修改按钮-->
    function updateCustomerFunc(btn){
        let item = $(btn).parents("div").parent("td").siblings("th");
        //防止多次提交
        $(btn).attr("disabled",true);
        let cid = item.text();
        let cname = item.next().text();
        let phone = item.next().next().text();
        let address = item.next().next().next().text();
        let password = item.next().next().next().next().text();
        item.parents("tr").remove();
        $("#customerList").append("<tr id='newLine'><th scope=\"row\"><input id='input_cid' type=\"text\" name=\"customer.cid\" value=" + cid + " required disabled></th> <td><input id='input_cname' type=\"text\" name=\"customer.cname\" value=" + cname + " required></td> <td><input id='input_phone' type=\"text\" name=\"customer.phone\" value=" + phone + " required></td> <td><input id='input_address' type=\"text\" name=\"customer.address\" value=" + address + " required></td> <td><input id='input_password' type=\"text\" name=\"customer.password\" value=" + password + " required></td> <td> <button onclick='submitCustomerFunc(this)' type=\"button\" class=\"btn btn-sm btn-outline-secondary\">提交</button> </td></tr>");
    }

    <!--对应删除按钮-->
    function deleteCustomerFunc(btn){
        if(confirm('确定要删除该行信息?')){
            let item = $(btn).parents("div").parent("td").siblings("th");
            //防止多次提交
            $(btn).attr("disabled",true);
            let cid = item.text();
            $.ajax({
                url:"customerManager!deleteCustomer.action",
                type:"post",
                data:{"customer.cid":cid},
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
