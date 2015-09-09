<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />

<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
<script src="${ctx}/static/js/hfive/trading.js" type="text/javascript"></script>

<title>微笑草帽</title>
</head>
<body>
	<header>
		<h1>
			<a href="" class="head_title">
				<label  class="page-title-text">交易服务</label>
			</a>
		</h1>
		<div class="search">
            <input type="text" placeholder="搜索" class="search-txt">
            <a href="###" class="i" id="search_home">&nbsp;</a>
        </div>
        <div class="userCenter">
        	<a href="">
        		<img class="user_info" src="${ctx}/static/images/user.png"  alt="商户中心">
        	</a>
        </div>
	</header>
	<div id="main_div">
	</div>
	<div id="product_purchase_select">
       <div>
       	<img class="product_select" id="product_select" src="${ctx}/static/images/product_selected.png"  alt="供应">
       </div>
       <div>
       	<img class="purchase_select" id="purchase_select" src="${ctx}/static/images/purchase_notselectd.png"  alt="采购">
       </div>
	</div>

</body>
</html>