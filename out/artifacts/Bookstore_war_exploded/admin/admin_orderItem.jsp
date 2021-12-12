<%@ taglib prefix="s" uri="/struts-tags" %>
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
                        <button id="addOrderItemButton" type="button" class="btn btn-sm btn-outline-secondary">新增条目</button>
                    </div>
                </div>
            </div>

            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">书号</th>
                    <th scope="col">数量</th>
                    <th scope="col">操作</th>
                </tr>
                </thead>
                <tbody id="orderItemList">
                    <s:iterator value="orderItemList">
                        <tr>
                            <th scope="row"><s:property value="bid"/></th>
                            <td><s:property value="quantity"/></td>
                            <td>
                                <div class="btn-group mr-2">
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="updateOrderItemFunc(this)">修改</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="deleteOrderItemFunc(this)">删除</button>
                                </div>
                            </td>
                        </tr>
                    </s:iterator>
                </tbody>
            </table>
            <!--此页对应的订单号-->
            <p id="oid_value" class="invisible">${oidOfOrderItems}</p>
        </main>
    </div>
</div>
<!-- 设置左侧导航栏为正确选中项-->
<script type="text/javascript">
    $(document).ready(function(){
        $("#order").addClass("active");
    });

    <!--对应添加按钮-->
    $("#addOrderItemButton").click(function() {
        $("#orderItemList").append("<tr id='newLine'><th scope=\"row\"><input id='input_bid' type=\"text\" placeholder=\"书号\" required></td> <td><input id='input_quantity' type=\"text\" placeholder=\"数量\" required></td> <td> <button onclick='submitOrderItemFunc(this)' type=\"button\" class=\"btn btn-sm btn-outline-secondary\">提交</button> </td></tr>");
        //只有在一条新记录提交完成后，才能创建下一条新的记录。
        $(this).attr("disabled",true);
    });

    <!--对应提交按钮-->
    function submitOrderItemFunc(btn){
        //防止多次提交
        $(btn).attr("disabled",true);
        let oid = $("#oid_value").text();
        let bid = $("#input_bid").val();
        let quantity = $("#input_quantity").val();
        $.ajax({
            url:"orderItemManager!addOrUpdateOrderItem.action",
            type:"post",
            data:{"orderItem.oid":oid,"orderItem.bid":bid,"orderItem.quantity":quantity},
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
                    //只有在一条新记录提交完成后，才能创建下一条新的记录。
                    $("#addOrderItemButton").attr("disabled",false);
                    $("#newLine").remove();
                    $("#orderItemList").append("<tr><th scope='row'>" + bid + "</th> <td>" + quantity + "</td> <td> <div class='btn-group mr-2'> <button type='button' class='btn btn-sm btn-outline-secondary' onclick='updateOrderItemFunc(this)'>修改</button><button type='button' class='btn btn-sm btn-outline-secondary' onclick='deleteOrderItemFunc(this)'>删除</button></div></td></tr>'");
                }else {
                    //可以再次尝试提交
                    $(btn).attr("disabled",false);
                }
            }
        })
    }

    <!--对应修改按钮-->
    function updateOrderItemFunc(btn){
        let item = $(btn).parents("div").parent("td").siblings("th");
        //防止多次提交
        $(btn).attr("disabled",true);
        let bid = item.text();
        let quantity = item.next().text();
        alert(bid);
        alert(quantity);
        item.parents("tr").remove();
        $("#orderItemList").append("<tr id='newLine'><th scope=\"row\"><input id='input_bid' type=\"text\" value=" + bid + " disabled></th> <td><input id='input_quantity' type=\"text\" value=" + quantity + " required></td> <td> <button onclick='submitOrderItemFunc(this)' type=\"button\" class=\"btn btn-sm btn-outline-secondary\">提交</button> </td></tr>");
    }

    <!--对应删除按钮-->
    function deleteOrderItemFunc(btn){
        if(confirm('确定要删除该行信息?')){
            let item = $(btn).parents("div").parent("td").siblings("th");
            //防止多次提交
            $(btn).attr("disabled",true);
            let oid = $("#oid_value").text();
            let bid = item.text();
            $.ajax({
                url:"orderItemManager!deleteOrderItem.action",
                type:"post",
                data:{"orderItem.oid":oid,"orderItem.bid":bid},
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
