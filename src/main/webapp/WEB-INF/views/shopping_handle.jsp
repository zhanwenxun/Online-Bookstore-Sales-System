<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>订单管理</title>
    <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${cp}/css/style.css" rel="stylesheet">

    <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${cp}/js/layer.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="${cp}/js/html5shiv.min.js"></script>
    <script src="${cp}/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!--导航栏部分-->
<jsp:include page="include/header.jsp"/>

<!-- 中间内容 -->
<div class="container-fluid bigHead">
    <div class="row">
        <div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
            <div class="jumbotron">
                <h1>欢迎来到订单处理页</h1>
                <p>所有购买清单为</p>
            </div>
        </div>
        <div class="col-sm-10  col-md-10 col-sm-offset-1 col-md-offset-1">
            <div class="row">
                <ul class="nav nav-tabs list-group-diy" role="tablist">
                    <li role="presentation" class="active list-group-item-diy"><a href="#unHandle" aria-controls="unHandle" role="tab" data-toggle="tab">待发货订单&nbsp;<span class="badge" id="unHandleCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#transport" aria-controls="transport" role="tab" data-toggle="tab">运输中订单&nbsp;<span class="badge" id="transportCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#receive" aria-controls="receive" role="tab" data-toggle="tab">已收货订单&nbsp;<span class="badge" id="receiveCount">0</span></a></li>
                    <li role="presentation" class="list-group-item-diy"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">全部订单&nbsp;<span class="badge" id="allCount">0</span></a></li>
                </ul>

                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="unHandle">
                        <table class="table table-hover center" id="unHandleTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="transport">
                        <table class="table table-hover center" id="transportTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="receive">
                        <table class="table table-hover center" id="receiveTable">
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="all">
                        <table class="table table-hover center" id="allTable">
                        </table>
                        <input type="text" id="Uid" style="margin-left:10px; margin-right:10px;">
                        <button style="margin-left:10px; margin-right:35px;" class="btn" onclick="SelectByUid()">按用户名查询</button>
                        <input style="margin-left:10px; margin-right:10px;" type="text" id="Pid">
                        <button style="margin-left:10px; margin-right:10px;" class="btn" onclick=SelectByPid()>按图书id查询</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 尾部 -->
<jsp:include page="include/foot.jsp"/>

<script type="text/javascript">
    var loading = layer.load(0);
    updateShoppingRecords();

    function updateShoppingRecords() {

        var TotalMoney = 0;
        var TotalSum = 0;

        var orderArray = new Array;
        orderArray[0] = "未发货";
        orderArray[1] = "配送中";
        orderArray[2] = "已收货";
        var unHandleTable = document.getElementById("unHandleTable");
        var transportTable = document.getElementById("transportTable");
        var receiveTable = document.getElementById("receiveTable");
        var allTable = document.getElementById("allTable");

        var unHandleCount = document.getElementById("unHandleCount");
        var transportCount = document.getElementById("transportCount");
        var receiveCount = document.getElementById("receiveCount");
        var allCount = document.getElementById("allCount");

        var unHandleCounts = parseInt(unHandleCount.innerHTML);
        var transportCounts = parseInt(transportCount.innerHTML);
        var receiveCounts = parseInt(receiveCount.innerHTML);
        var allCounts = parseInt(allCount.innerHTML);

        var allShoppingRecords = getAllShoppingRecords();
        unHandleTable.innerHTML = "";
        transportTable.innerHTML = "";
        receiveTable.innerHTML = "";
        allTable.innerHTML = "";
        var unHandleHTML = '<tr>'+
            '<th>购买者</th>'+
            '<th>商品名称</th>'+
            '<th>购买数量</th>'+
            '<th>付款金额</th>'+
            '<th>订单状态</th>'+
            '<th>发货</th>'+
            '</tr>';
        var transportHTML = '<tr>'+
            '<th>购买者</th>'+
            '<th>商品名称</th>'+
            '<th>购买数量</th>'+
            '<th>付款金额</th>'+
            '<th>送货地址</th>'+
            '<th>联系电话</th>'+
            '<th>订单状态</th>'+
            '<th>生成物流出账单</th>'+
            '</tr>';
        var receiveHTML = '<tr>'+
            '<th>购买者</th>'+
            '<th>商品名称</th>'+
            '<th>购买数量</th>'+
            '<th>付款金额</th>'+
            '<th>订单状态</th>'+
            '<th>生成退货出账单</th>'+
            '</tr>';
        var allHTML = '<tr>'+
            '<th>购买者</th>'+
            '<th>商品名称</th>'+
            '<th>购买数量</th>'+
            '<th>付款金额</th>'+
            '<th>订单状态</th>'+
            '</tr>';
        var unHandleHTMLTemp = "";
        var transportHTMLTemp = "";
        var receiveHTMLTemp = "";
        var allHTMLTemp = "";

        for(var i=0;i<allShoppingRecords.length;i++){
            var user = getUserById(allShoppingRecords[i].userId);
            var product = getProductById(allShoppingRecords[i].productId);
            allHTMLTemp  += '<tr>'+
                '<td>'+user.name+'</td>'+
                '<td>'+product.name+'</td>'+
                '<td>'+allShoppingRecords[i].counts+'</td>'+
                '<td>'+allShoppingRecords[i].productPrice+'</td>'+
                '<td>'+orderArray[allShoppingRecords[i].orderStatus]+'</td>'+
                '</tr>';
            allCounts++;

            TotalMoney += allShoppingRecords[i].productPrice;
            TotalSum += allShoppingRecords[i].counts;

            if(allShoppingRecords[i].orderStatus == 0){
                unHandleHTMLTemp+= '<tr>'+
                    '<td>'+user.name+'</td>'+
                    '<td>'+product.name+'</td>'+
                    '<td>'+allShoppingRecords[i].counts+'</td>'+
                    '<td>'+allShoppingRecords[i].productPrice+'</td>'+
                    '<td>'+orderArray[allShoppingRecords[i].orderStatus]+'</td>'+
                    '<td>'+
                    '<button class="btn btn-primary btn-sm" onclick="sendProducts('+allShoppingRecords[i].userId+','
                    +allShoppingRecords[i].productId+',\''+allShoppingRecords[i].time+'\')">发货</button>'+
                    '</td>'+
                    '</tr>';
                unHandleCounts++;
            }
            else if(allShoppingRecords[i].orderStatus ==1){
                var address = getUserAddress(allShoppingRecords[i].userId);
                var money = allShoppingRecords[i].productPrice*0.2;
                var phoneNumber = getUserPhoneNumber(allShoppingRecords[i].userId);
                transportHTMLTemp+= '<tr>'+
                    '<td>'+user.name+'</td>'+
                    '<td>'+product.name+'</td>'+
                    '<td>'+allShoppingRecords[i].counts+'</td>'+
                    '<td>'+allShoppingRecords[i].productPrice+'</td>'+
                    '<td>'+address+'</td>'+
                    '<td>'+phoneNumber+'</td>'+
                    '<td>'+orderArray[allShoppingRecords[i].orderStatus]+'</td>'+
                    '<td>'+
                    '<button class="btn btn-primary btn-sm" onclick="transProducts('+allShoppingRecords[i].userId+','
                    +allShoppingRecords[i].productId+',\''+money+'\')">生成物流出账单</button>'+
    '</td>'+
                    '</tr>';
                transportCounts++;
            }
            else if(allShoppingRecords[i].orderStatus ==2){
                receiveHTMLTemp += '<tr>'+
                    '<td>'+user.name+'</td>'+
                    '<td>'+product.name+'</td>'+
                    '<td>'+allShoppingRecords[i].counts+'</td>'+
                    '<td>'+allShoppingRecords[i].productPrice+'</td>'+
                    '<td>'+orderArray[allShoppingRecords[i].orderStatus]+'</td>'+
                    '<td>'+
                    '<button class="btn btn-primary btn-sm" onclick="returnProducts('+allShoppingRecords[i].userId+','
                    +allShoppingRecords[i].productId+',\''+allShoppingRecords[i].time+'\')">生成退货出账单</button>'+
                    '</td>'+
                    '</tr>';
                receiveCounts++;
            }
        }
        if(unHandleHTMLTemp == ""){
            unHandleHTML='<div class="row">'+
                '<div class="col-sm-3 col-md-3 col-lg-3"></div> '+
                '<div class="col-sm-6 col-md-6 col-lg-6">'+
                '<h2>没有相关订单</h2>'+
                '</div>'+
                '</div>';
        }
        else
            unHandleHTML+=unHandleHTMLTemp;
        if(transportHTMLTemp == ""){
            transportHTML = '<div class="row">'+
                '<div class="col-sm-3 col-md-3 col-lg-3"></div> '+
                '<div class="col-sm-6 col-md-6 col-lg-6">'+
                '<h2>没有相关订单</h2>'+
                '</div>'+
                '</div>';
        }
        else
            transportHTML+=transportHTMLTemp;
        if(receiveHTMLTemp == ""){
            receiveHTML = '<div class="row">'+
                '<div class="col-sm-3 col-md-3 col-lg-3"></div> '+
                '<div class="col-sm-6 col-md-6 col-lg-6">'+
                '<h2>没有相关订单</h2>'+
                '</div>'+
                '</div>';
        }
        else
            receiveHTML+=receiveHTMLTemp;

        if(allHTMLTemp == ""){
            allHTML = '<div class="row">'+
                '<div class="col-sm-3 col-md-3 col-lg-3"></div> '+
                '<div class="col-sm-6 col-md-6 col-lg-6">'+
                '<h2>没有相关订单</h2>'+
                '</div>'+
                '</div>';
        }
        else {
            allHTMLTemp  += '<tr>'+
                '<td>'+'</td>'+
                '<td>'+'</td>'+
                '<td><bold>'+TotalSum+'</bold></td>'+
                '<td><bold>'+TotalMoney+'</bold></td>'+
                '<td>'+'</td>'+
                '</tr>';
            allHTML+=allHTMLTemp;
        }

        unHandleCount.innerHTML = unHandleCounts;
        transportCount.innerHTML = transportCounts;
        receiveCount.innerHTML = receiveCounts;
        allCount.innerHTML = allCounts;

        unHandleTable.innerHTML += unHandleHTML;
        transportTable.innerHTML += transportHTML;
        receiveTable.innerHTML += receiveHTML;
        allTable.innerHTML += allHTML;
        layer.close(loading);
    }

    function getAllShoppingRecords() {
        judgeIsLogin();
        var shoppingRecordProducts = "";
        var nothing = {};
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/getAllShoppingRecords',
            data : nothing,
            dataType : 'json',
            success : function(result) {
                shoppingRecordProducts = result.result;
            },
            error : function(result) {
                layer.alert('查询错误');
            }
        });
        shoppingRecordProducts = eval("("+shoppingRecordProducts+")");
        return shoppingRecordProducts;
    }

    function getShoppingRecords(userId) {
        var shoppingRecordProducts = "";

        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/getShoppingRecords',
            data : userId,
            dataType : 'json',
            success : function(result) {
                shoppingRecordProducts = result.result;
            },
            error : function(result) {
                layer.alert('查询错误');
            }
        });
        shoppingRecordProducts = eval("("+shoppingRecordProducts+")");
        return shoppingRecordProducts;
    }

    /*function SelectByUid() {
        var TotalMoney=0;
        var TotalNum=0;
        var allTable = document.getElementById("allTable");
        var allCount = document.getElementById("allCount");
        var allCounts = parseInt(allCount.innerHTML);
        var Uid = document.getElementById("Uid").value;
        var allShoppingRecords = getShoppingRecords(Uid);

        allTable.innerHTML = "";

        var allHTML = '<tr>' +
            '<th>购买者</th>' +
            '<th>商品名称</th>' +
            '<th>购买数量</th>' +
            '<th>付款金额</th>' +
            '<th>订单状态</th>' +
            '</tr>';

        var allHTMLTemp = "";

        for (var i = 0; i < allShoppingRecords.length; i++) {
            var user = getUserById(allShoppingRecords[i].userId);
            var product = getProductById(allShoppingRecords[i].productId);

            TotalMoney += allShoppingRecords[i].productPrice;
            TotalNum += allShoppingRecords[i].counts;

            allHTMLTemp += '<tr>' +
                '<td>' + user.name + '</td>' +
                '<td>' + product.name + '</td>' +
                '<td>' + allShoppingRecords[i].counts + '</td>' +
                '<td>' + allShoppingRecords[i].productPrice + '</td>' +
                '<td>' + orderArray[allShoppingRecords[i].orderStatus] + '</td>' +
                '</tr>';
            allCounts++;
        }

        if (allHTMLTemp == "") {
            allHTML = '<div class="row">' +
                '<div class="col-sm-3 col-md-3 col-lg-3"></div> ' +
                '<div class="col-sm-6 col-md-6 col-lg-6">' +
                '<h2>没有相关订单</h2>' +
                '</div>' +
                '</div>';
        } else {
            allHTMLTemp += '<tr>' +
                '<td>' + Uid + '</td>' +
                '<td>' + '</td>' +
                '<td>' + TotalNum'+</td>' +
            '<td>' + TotalMoney + '</td>' +
            '<td>' + '</td>' +
            '</tr>';
            allHTML += allHTMLTemp;
        }
        allCount.innerHTML = allCounts;
        allTable.innerHTML += allHTML;
    }*/

    function getShoppingRecordsByPid(productId) {
        var shoppingRecordProducts = "";

        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/getShoppingRecords',
            data : productId,
            dataType : 'json',
            success : function(result) {
                shoppingRecordProducts = result.result;
            },
            error : function(result) {
                layer.alert('查询错误');
            }
        });
        shoppingRecordProducts = eval("("+shoppingRecordProducts+")");
        return shoppingRecordProducts;
    }

    /*function SelectByPid() {
        var TotalMoney=0;
        var TotalNum=0;
        var allTable = document.getElementById("allTable");
        var allCount = document.getElementById("allCount");
        var allCounts = parseInt(allCount.innerHTML);
        var Pid = document.getElementById("Pid").value;
        var allShoppingRecords = getShoppingRecordsByPid(Pid);

        allTable.innerHTML = "";

        var allHTML = '<tr>' +
            '<th>购买者</th>' +
            '<th>商品名称</th>' +
            '<th>购买数量</th>' +
            '<th>付款金额</th>' +
            '<th>订单状态</th>' +
            '</tr>';

        var allHTMLTemp = "";

        for (var i = 0; i < allShoppingRecords.length; i++) {
            var user = getUserById(allShoppingRecords[i].userId);
            var product = getProductById(allShoppingRecords[i].productId);

            TotalMoney += allShoppingRecords[i].productPrice;
            TotalNum += allShoppingRecords[i].counts;

            allHTMLTemp += '<tr>' +
                '<td>' + user.name + '</td>' +
                '<td>' + product.name + '</td>' +
                '<td>' + allShoppingRecords[i].counts + '</td>' +
                '<td>' + allShoppingRecords[i].productPrice + '</td>' +
                '<td>' + orderArray[allShoppingRecords[i].orderStatus] + '</td>' +
                '</tr>';
            allCounts++;
        }

        if (allHTMLTemp == "") {
            allHTML = '<div class="row">' +
                '<div class="col-sm-3 col-md-3 col-lg-3"></div> ' +
                '<div class="col-sm-6 col-md-6 col-lg-6">' +
                '<h2>没有相关订单</h2>' +
                '</div>' +
                '</div>';
        } else {
            allHTMLTemp += '<tr>' +
                '<td>'  + '</td>' +
                '<td>' + Pid + '</td>' +
                '<td>' + TotalNum'+</td>' +
            '<td>' + TotalMoney + '</td>' +
            '<td>' + '</td>' +
            '</tr>';
            allHTML += allHTMLTemp;
        }
        allCount.innerHTML = allCounts;
        allTable.innerHTML += allHTML;
    }*/

    function getProductById(id) {
        var productResult = "";
        var product = {};
        product.id = id;
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/getProductById',
            data : product,
            dataType : 'json',
            success : function(result) {
                productResult = result.result;
            },
            error : function(result) {
                layer.alert('查询错误');
            }
        });
        productResult = JSON.parse(productResult);
        return productResult;
    }

    function getUserById(id) {
        var userResult = "";
        var user = {};
        user.id = id;
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/getUserById',
            data : user,
            dataType : 'json',
            success : function(result) {
                userResult = result.result;
            },
            error : function(result) {
                layer.alert('查询错误');
            }
        });
        userResult = JSON.parse(userResult);
        return userResult;
    }

    function getUserAddress(id) {
        var address = "";
        var user = {};
        user.id = id;
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/getUserAddressAndPhoneNumber',
            data : user,
            dataType : 'json',
            success : function(result) {
                address = result.address;
            },
            error : function(result) {
                layer.alert('查询错误');
            }
        });
        return address;
    }

    function getUserPhoneNumber(id) {
        var phoneNumber = "";
        var user = {};
        user.id = id;
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/getUserAddressAndPhoneNumber',
            data : user,
            dataType : 'json',
            success : function(result) {
                phoneNumber = result.phoneNumber;
            },
            error : function(result) {
                layer.alert('查询错误');
            }
        });
        return phoneNumber;
    }

    function judgeIsLogin() {
        if("${currentUser}" == null || "${currentUser}" == undefined || "${currentUser}" ==""){
            window.location.href = "${cp}/login";
        }
    }

    function sendProducts(userId,productId,time) {
        var sendResult = "";
        var shoppingRecord = {};
        shoppingRecord.userId = userId;
        shoppingRecord.productId = productId;
        shoppingRecord.time = time;
        shoppingRecord.orderStatus = 1;
        $.ajax({
            async : false, //设置同步
            type : 'POST',
            url : '${cp}/changeShoppingRecord',
            data : shoppingRecord,
            dataType : 'json',
            success : function(result) {
                sendResult = result.result;
            },
            error : function(result) {
                layer.alert('发货错误');
            }
        });
        if(sendResult == "success")
            window.location.href = "${cp}/shopping_handle";
    }

    function returnProducts(userId,productId,time) {
        var html = '<div class="col-sm-1 col-md-1 col-lg-1"></div>'+
            '<div class="col-sm-10 col-md-10 col-lg-10">'+
            '<table class="table confirm-margin">';
        html +='<th>客户ID：</th>'+
            '<td>'+userId+'</td>'+
            '</tr>'+
            '<tr>'+
            '<th>图书ID：</th>'+
            '<td>'+productId+'</td>'+
            '</tr>'+
            '<tr>'+
            '<th>时间：</th>'+
            '<td>'+time+'</td>'+
            '</tr>'+
            '</table>'+
            '<div class="row">';
        html += '<div style="text-align:center; padding-bottom: 3px;"><a href="${cp}/shopping_handle"><button style=" width:150px;height:60px; class="btn btn-danger col-sm-4 col-md-4 col-lg-4"> 打印 </button></a></div>';
        html += '</div>'+ '</div>';
        layer.open({
            type:1,
            title:'请确认退货出账单：',
            content:html,
            area:['650px','350px'],
        });
    }

    function transProducts(userId,productId,money) {
        var html = '<div class="col-sm-1 col-md-1 col-lg-1"></div>'+
            '<div class="col-sm-10 col-md-10 col-lg-10">'+
            '<table class="table confirm-margin">';
        html +='<th>客户ID：</th>'+
            '<td>'+userId+'</td>'+
            '</tr>'+
            '<tr>'+
            '<th>图书ID：</th>'+
            '<td>'+productId+'</td>'+
            '</tr>'+
            '<tr>'+
            '<th>运费</th>'+
            '<td>'+money+'</td>'+
            '</tr>'+
            '</table>'+
            '<div class="row">';
        html += '<div style="text-align:center; padding-bottom: 3px;"><a href="${cp}/shopping_handle"><button style=" width:150px;height:60px; class="btn btn-danger col-sm-4 col-md-4 col-lg-4"> 打印 </button></a></div>';
        html += '</div>'+ '</div>';
        layer.open({
            type:1,
            title:'请确认物流出账单：',
            content:html,
            area:['650px','350px'],
        });
    }
</script>
</body>
</html>