<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <title>昌航书店</title>
	  <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
	  <link href="${cp}/css/style.css" rel="stylesheet">

	  <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
	  <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
	  <script src="${cp}/js/layer.js" type="text/javascript"></script>
  </head>

  <body>

	<jsp:include page="include/header.jsp"/>

	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-3 col-md-2 sidebar sidebar-1">
				<ul class="nav nav-sidebar">
					<li class="list-group-item-diy"><a href="#productArea1">推荐图书<span class="sr-only">(current)</span></a></li>
					<li class="list-group-item-diy"><a href="#productArea2">计算机</a></li>
					<li class="list-group-item-diy"><a href="#productArea3">文学</a></li>
					<li class="list-group-item-diy"><a href="#productArea4">数学</a></li>
					<li class="list-group-item-diy"><a href="#productArea5">律法</a></li>
					<li class="list-group-item-diy"><a href="#productArea6">军事</a></li>
					<li class="list-group-item-diy"><a href="#productArea7">推理</a></li>
				</ul>
			</div>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="jumbotron" style="height: 250px;">
					<div style="float: left">
						<h1>欢迎来到昌航书店</h1>
						<p>您想要的图书，在这里全都有！</p>
					</div>
					<div style="float: right">
						<img src="${cp}/img/logo.png" style="width: 400px; height: 200px;">
					</div>
				</div>

				<img src="${cp}/img/banner.jpg" style="width: 1500px; height: 500px;">

				<div name="productArea1" class="row pd-10" id="productArea1">
				</div>

				<div name="productArea2" class="row" id="productArea2">
				</div>

				<div name="productArea3" class="row" id="productArea3">
				</div>

                <div name="productArea4" class="row" id="productArea4">
				</div>

				<div name="productArea5" class="row" id="productArea5">
				</div>

				<div name="productArea6" class="row" id="productArea6">
				</div>

				<div name="productArea7" class="row" id="productArea7">
				</div>


			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
				<jsp:include page="include/foot.jsp"/>
			</div>
		</div>
	</div>

  <script type="text/javascript">

	  var loading = layer.load(0);

      var productType = new Array;
      productType[1] = "畅销";
      productType[2] = "计算机";
      productType[3] = "文学";
      productType[4] = "数学";
      productType[5] = "律法";
      productType[6] = "军事";
      productType[7] = "推理";


	  listProducts();

	  /*function listProducts() {
		  var allProduct = getAllProducts();
          var mark = new Array;
          mark[1] = 0;
          mark[2] = 0;
          mark[3] = 0;
          mark[4] = 0;
          mark[5] = 0;
          mark[6] = 0;
          mark[7] = 0;
          for(var i=0;i<allProduct.length;i++){
              var html = "";
			  var imgURL = "${cp}/img/"+allProduct[i].id+".jpg";
			  html += '<div class="col-sm-4 col-md-4" >'+
					  '<div class="boxes pointer" onclick="productDetail('+allProduct[i].id+')">'+
					  '<div class="bigimg">'+
					  '<img src="'+imgURL+'">'+
					  '</div>'+
					  '<p class="product-name">'+allProduct[i].name+'</p>'+
					  '<p class="product-price">¥'+allProduct[i].price+'</p>'+
					  '</div>'+
					  '</div>';
              var id = "productArea"+allProduct[i].type;
              var productArea = document.getElementById(id);
              if(mark[allProduct[i].type] == 0){
                  html ='<hr/><h1>'+productType[allProduct[i].type]+'</h1><hr/>'+html;
                  mark[allProduct[i].type] = 1;
              }
              productArea.innerHTML += html;
		  }
		  layer.close(loading);
	  }*/

	  function listProducts() {
		  var allProduct = getAllProducts();

		  var min = 100;
		  var t ;
		  var mark = new Array;
		  mark[1] = 0;
		  mark[2] = 0;
		  mark[3] = 0;
		  mark[4] = 0;
		  mark[5] = 0;
		  mark[6] = 0;
		  mark[7] = 0;
		  var a = new Array;
		  for (var i =0 ;i<allProduct.length;i++){
			  a[i] = 0;
			  if ((allProduct[i].counts)<=min){
				  min = allProduct[i].counts;
				  t = allProduct[i].type;
			  }
		  }
		  for(var i=0;i<allProduct.length;i++){
			  var html = "";
			  var imgURL = "${cp}/img/"+allProduct[i].id+".jpg";
			  html += '<div class="col-sm-4 col-md-4" >'+
					  '<div class="boxes pointer" onclick="productDetail('+allProduct[i].id+')">'+
					  '<div class="bigimg">'+
					  '<img src="'+imgURL+'">'+
					  '</div>'+
					  '<p class="product-name">'+allProduct[i].name+'</p>'+
					  '<p class="product-price">¥'+allProduct[i].price+'</p>'+
					  '</div>'+
					  '</div>';
			  var id = "productArea"+allProduct[i].type;

			  if(allProduct[i].type == t && a[i] == 0){
				  id = "productArea1";
				  if(mark[1] == 0){
					  html ='<hr/><h1>'+productType[1]+'</h1><hr/>'+html;
					  mark[1] = 1;
				  }
				  a[i]++;
				  i = i-1;

			  }
			  var productArea = document.getElementById(id);
			  if(mark[allProduct[i].type] == 0){
				  html ='<hr/><h1>'+productType[allProduct[i].type]+'</h1><hr/>'+html;
				  mark[allProduct[i].type] = 1;
			  }
			  productArea.innerHTML += html;
		  }
		  layer.close(loading);
	  }

	  function getAllProducts() {
		  var allProducts = null;
		  var nothing = {};
		  $.ajax({
			  async : false,
			  type : 'POST',
			  url : '${cp}/getAllProducts',
			  data : nothing,
			  dataType : 'json',
			  success : function(result) {
				  if (result!=null) {
					  allProducts = result.allProducts;
				  }
				  else{
					  layer.alert('查询错误');
				  }
			  },
			  error : function(resoult) {
				  layer.alert('查询错误');
			  }
		  });

		  allProducts = eval("("+allProducts+")");
		  return allProducts;
	  }

	  function productDetail(id) {
		  var product = {};
		  var jumpResult = '';
		  product.id = id;
		  $.ajax({
			  async : false,
			  type : 'POST',
			  url : '${cp}/productDetail',
			  data : product,
			  dataType : 'json',
			  success : function(result) {
				  jumpResult = result.result;
			  },
			  error : function(resoult) {
				  layer.alert('查询错误');
			  }
		  });

		  if(jumpResult == "success"){
			  window.location.href = "${cp}/product_detail";
		  }
	  }

  </script>


  </body>
</html>