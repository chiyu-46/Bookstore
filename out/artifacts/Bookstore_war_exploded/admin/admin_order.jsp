<%@ taglib prefix="s" uri="/struts-tags" %>
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
                        <button type="button" class="btn btn-sm btn-outline-secondary" id="addOrderButton">新增订单</button>
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
                <tbody id="orderList">
                    <s:iterator value="orderList">
                        <tr>
                            <th scope="row"><s:property value="oid"/></th>
                            <td><s:property value="cid"/></td>
                            <td><s:property value="otime"/></td>
                            <td><s:property value="ostate"/></td>
                            <td><s:property value="receptor"/></td>
                            <td><s:property value="address"/></td>
                            <td><s:property value="phone"/></td>
                            <td>
                                <div class="btn-group mr-2">
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="updateOrderFunc(this)">修改</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="deleteOrderFunc(this)">删除</button>
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
        $("#order").addClass("active");
    });

    <!--对应添加按钮-->
    $("#addOrderButton").click(function() {
        $("#orderList").append("<tr id='newLine'><th scope=\"row\"><input id='input_oid' type=\"text\" name=\"order.oid\" placeholder=\"订单号\" disabled></th> <td><input id='input_cid' type=\"text\" name=\"order.cid\" placeholder=\"客户号\" required></td> <td><input id='input_otime' type=\"text\" name=\"order.otime\" placeholder=\"下单时间\" disabled></td> <td><input id='input_ostate' type=\"text\" name=\"order.ostate\" placeholder=\"状态\" disabled></td> <td><input id='input_receptor' type=\"text\" name=\"order.receptor\" placeholder=\"收货人\" required></td> <td><input id='input_address' type=\"text\" name=\"order.address\" placeholder=\"收货地址\" required></td> <td><input id='input_phone' type=\"text\" name=\"order.phone\" placeholder=\"电话\" required></td> <td> <button onclick='submitOrderFunc(this)' type=\"button\" class=\"btn btn-sm btn-outline-secondary\">提交</button> </td></tr>");
        //只有在一条新记录提交完成后，才能创建下一条新的记录。
        $(this).attr("disabled",true);
    });

    <!--对应提交按钮-->
    function submitOrderFunc(btn){
        //防止多次提交
        $(btn).attr("disabled",true);
        let oid = $("#input_oid").val();
        let cid = $("#input_cid").val();
        let otime = $("#input_otime").val();
        let ostate = $("#input_ostate").val();
        let receptor = $("#input_receptor").val();
        let address = $("#input_address").val();
        let phone = $("#input_phone").val();
        $.ajax({
            url:"orderManager!addOrUpdateOrder.action",
            type:"post",
            data:{"order.oid":oid,"order.cid":cid,"order.otime":otime,"order.ostate":ostate,"order.receptor":receptor,"order.address":address,"order.phone":phone},
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
                    oid = obj.oid;
                    otime = obj.otime;
                    ostate = obj.ostate;
                    //只有在一条新记录提交完成后，才能创建下一条新的记录。
                    $("#addOrderButton").attr("disabled",false);
                    $("#newLine").remove();
                    $("#orderList").append("<tr><th scope='row'>" + oid + "</th> <td>" + cid + "</td> <td>" + otime + "</td> <td>" + ostate + "</td> <td>" + receptor + "</td> <td>" + address + "</td> <td>" + phone + "</td> <td> <div class='btn-group mr-2'> <button type='button' class='btn btn-sm btn-outline-secondary' onclick='updateOrderFunc(this)'>修改</button><button type='button' class='btn btn-sm btn-outline-secondary' onclick='deleteOrderFunc(this)'>删除</button></div></td></tr>'");
                }else {
                    //可以再次尝试提交
                    $(btn).attr("disabled",false);
                }
            }
        })
    }

    <!--对应修改按钮-->
    function updateOrderFunc(btn){
        let item = $(btn).parents("div").parent("td").siblings("th");
        //防止多次提交
        $(btn).attr("disabled",true);
        let oid = item.text();
        let cid = item.next().text();
        let otime = item.next().next().text();
        let ostate = item.next().next().next().text();
        let receptor = item.next().next().next().next().text();
        let address = item.next().next().next().next().next().text();
        let phone = item.next().next().next().next().next().next().text();
        item.parents("tr").remove();
        $("#orderList").append("<tr id='newLine'><th scope=\"row\"><input id='input_oid' type=\"text\" value=" + oid + " disabled></th> <td><input id='input_cid' type=\"text\" value=" + cid + " required></td> <td><input id='input_otime' type=\"text\" value=" + otime + " disabled></td> <td><input id='input_ostate' type=\"text\" value=" + ostate + " ></td> <td><input id='input_receptor' type=\"text\" value=" + receptor + " required></td> <td><input id='input_address' type=\"text\" value=" + address + " required></td> <td><input id='input_phone' type=\"text\"  value=" + phone + " required></td> <td> <button onclick='submitOrderFunc(this)' type=\"button\" class=\"btn btn-sm btn-outline-secondary\">提交</button> </td></tr>");
    }

    <!--对应删除按钮-->
    function deleteOrderFunc(btn){
        if(confirm('确定要删除该行信息?')){
            let item = $(btn).parents("div").parent("td").siblings("th");
            //防止多次提交
            $(btn).attr("disabled",true);
            let oid = item.text();
            $.ajax({
                url:"orderManager!deleteOrder.action",
                type:"post",
                data:{"order.oid":oid},
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
