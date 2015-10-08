<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<!DOCTYPE html >
<html>
<head>
	<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
	<title>微笑草帽</title>
	
	<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/customerCenter.css" type="text/css" />
	
	<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>
	<script src="${ctx}/static/js/hfive/customerCenter.js"></script>
</head>
<body>
	<div class="background-img">
		
	</div>
	<div class="background-zhezhao">
		
	</div>
	<div id="main_div">
		<div id="header">
			<div class="logo">
				<img id="curlogo" alt="" src="${ctx}/static/images/logo.png">
			</div>
			<div class="userCenter">
	            	商户中心
	        </div>
	        <div class="search">
		        <a href="${ctx}/trading/product/center">
		        	<img class="search-img" src="${ctx}/static/images/back2.png"  alt="搜索">
		        </a>
	        </div>
		</div>
		<form id="productForm" action="${ctx}/customer/myPurchaselist" method="post">
			<div id="menu">
			    <ul id="nav">
			        <li><a href="${ctx}/customer/center">基本信息</a></li>
			        <li><a href="${ctx}/customer/centerProduct" class="">我的产品</a></li>
			        <li><a href="${ctx}/customer/centerPurchase" class="selected">我的采购</a></li>
			    </ul>
			    <div id="publish-myPP">
			    	<a href="${ctx}/trading/purchase/publish/new" id="a-pp">
			    		发布采购
			    	</a>
			    </div>
			    <div id="product_list">
					<ul class="list">
						
					</ul>
				</div>
			</div>
		</form>
	</div>
	
	<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
	<div id="help-bottom">
		<a href="${ctx}/trading/help">
       		<img class="help-img" src="/smilehat/static/images/help.png" alt="帮助">
       	</a>
	</div>
	<script src="${ctx}/static/js/hfive/trading.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			getItemList($("#productForm"),$("#product_list .list"));
		});
	</script>
</body>
</html>