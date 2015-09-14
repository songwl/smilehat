<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${ctx}/static/bootstrap/3.3.5/css/bootstrap.css">

<link rel="stylesheet" href="${ctx}/static/styles/hfive/unionfarm.css" type="text/css" />

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${ctx}/static/js/jquery/1.11.3/jquery-1.11.3.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${ctx}/static/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="${ctx}/static/js/hfive/trading.js" type="text/javascript"></script>

<title>微笑草帽</title>
</head>
<body>
	<header>
		<div class="logo">
			<a href="" class="head_title">
				<label  class="page-title-text"> &lt;联盟农场</label>
			</a>
		</div>
		<div class="search">
	          	<input type="text" class="form-control" placeholder="搜索">
        </div>
        <div class="userCenter">
        	<a href="">
        		<img class="user_info" src="${ctx}/static/images/green_user.png"  alt="商户中心">
        	</a>
        </div>
	</header>
	<div id="main_div">
		<div id="main_list_purchase">
			<form id="productForm" action="${ctx}/farm/list" method="post">
				<input type="hidden" name="pageNum" value="1" />
				<input type="hidden" name="numPerPage" value="10" />
				<div id="purchase_search">
					<div class="_search">
						<!-- Split button -->
						<div class="btn-group btn-my-group">
						  <button type="button" class="btn btn-default btn-my-select">地区选择</button>
						  <button type="button" class="btn btn-warning btn-my-select2 dropdown-toggle" data-toggle="dropdown" id="dropdownMenu1"  aria-haspopup="true" aria-expanded="false">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
						  </button>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						    <li><a href="#">Action</a></li>
						    <li><a href="#">Another action</a></li>
						    <li><a href="#">Something else here</a></li>
						    <li role="separator" class="divider"></li>
						    <li><a href="#">Separated link</a></li>
						  </ul>
						</div>
			        </div>
			        <div class="category_search" style="display:none">
			        	<div class="btn-group btn-my-group">
						  <button type="button" class="btn btn-default btn-my-select">品类选择</button>
						  <button type="button" class="btn btn-warning btn-my-select2 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    <span class="caret"></span>
						    <span class="sr-only">Toggle Dropdown</span>
						  </button>
						  <ul class="dropdown-menu dropdown-menu-right">
						    <li><a href="#">Action</a></li>
						    <li><a href="#">Another action</a></li>
						    <li><a href="#">Something else here</a></li>
						    <li role="separator" class="divider"></li>
						    <li><a href="#">Separated link</a></li>
						  </ul>
						</div>
			        </div>
				</div>
			</form>
			
			<div id="product_list">
				<ul class="list">
					
				</ul>
			</div>
		</div>
	
	<script type="text/javascript">
		$(function(){
			getProdct();
			
			function getProdct(){
				var $form = $("#productForm");
				
				$.post($form.attr("action"), $form.serialize(),
				   function(html){
						$("#product_list .list").append(html);
				   }, "html");
			}
			
		});
		
		
	</script>
</body>
</html>