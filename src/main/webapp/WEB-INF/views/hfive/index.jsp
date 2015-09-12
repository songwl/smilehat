<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
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
<%-- 		<img class="mian_line" id="mian_line" src="${ctx}/static/images/xuline.png" > --%>
		<div id="main_list">
			<div id="purchase_search">
				<div class="region_search">
		            <input type="text" placeholder="区域选择" class="search_purchase">
		            <img class="search_down" src="${ctx}/static/images/search_down.png">
		        </div>
		        <div class="category_search">
		            <input type="text" placeholder="品类选择" class="search_purchase">
		            <img class="search_down" src="${ctx}/static/images/search_down.png">
		        </div>
			</div>
			<div id="product_list">
				<ul class="list">
					<li>
						<a href="">
							<div class="row1">
								<div class="left">
									<span class="name">金帅苹果</span>
									<span>&nbsp;</span>
									<span class="tu">&nbsp;</span>
								</div>
								<div class="right">0.7元/斤</div>
							</div>
							<div class="row2">品类：苹果</div>
							<div class="row3">
								<div class="left">
									<img class="product_cert"  src="${ctx}/static/images/location.png">
									<img class="product_cert" src="${ctx}/static/images/location.png">
									<img class="product_cert" src="${ctx}/static/images/location.png">
<!-- 									<span class="lv"></span> -->
								</div>
								<div class="right">
									<span class="place_who">上海浦东新区直桥镇供销中心</span>
									<img class="product_cert" src="${ctx}/static/images/location.png">
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
		
		
	</div>
	<div id="product_purchase_select">
       <div>
       	<img class="product_select" id="product_select" src="${ctx}/static/images/product_selected.png"  alt="供应">
       </div>
       <div>
       		<img class="purchase_select" id="purchase_select" src="${ctx}/static/images/purchase_notselectd.png"  alt="采购">
       		
       </div>
	</div>
	<div id="product_purchase_publish">
		<img class="btn_pp" id="btn_pp" src="${ctx}/static/images/btn_pp_not.png"  alt="发布">
	</div>
</body>
</html>