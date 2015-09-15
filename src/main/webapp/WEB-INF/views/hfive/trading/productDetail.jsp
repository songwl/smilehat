<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/static/styles/hfive/productDetail.css" type="text/css" />

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${ctx}/static/js/jquery/1.11.3/jquery-1.11.3.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${ctx}/static/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="${ctx}/static/js/hfive/trading.js" type="text/javascript"></script>

<title>微笑草帽</title>
</head>
<body>
	<header>
		<div class="goback">
			<a href="${ctx}/trading/product/center">
        		<img class="back" src="${ctx}/static/images/logo.png"  alt="返回">
        	</a>
		</div>
        <div class="cur_title">
        	<label  class="page-title-text">产品详情</label>
        </div>
	</header>
		<div class="pageContent"> 
			<div class="farmContent" >
				<div>名称：${vm.name}  </div>     
				 <div>价格：${vm.price} {vm.priceUnit}</div>
				<div class="farmImg">
				假的
					<img src="${ctx}/${vm.user.photoAttach.downloadPath }">
				</div>
				<input type="hidden" name="user.id" value="${vm.user.id}">
				<div><a href="${ctx}/farm/detail/${vm.user.id}"> 商户名称：${vm.user.name} </a></div>    
				<div>规格：${vm.branchInfo}  </div>  
				<div>认证标签：
					<img class="product_cert"  src="${ctx}/static/images/location.png">
					<img class="product_cert" src="${ctx}/static/images/location.png">
					<img class="product_cert" src="${ctx}/static/images/location.png">
				</div>
				<div>上市时间：${vm.startTime}-${vm.endTime}</div>
<%-- 				<div>地址：${vm.region.parent.parent.regionName} ${vm.region.parent.regionName} ${vm.region.regionName} ${vm.address}</div> --%>
				<div>
					描述：
					<textarea rows="" cols="" class="farmDesc" name="description" style="width: 100%;" wrap="virtual"   readonly="true">${vm.description}</textarea>
				</div>
<!-- 				<div> -->
<!-- 					联系方式：： -->
<!-- 					<a >点击获取联系方式</a> -->
<!-- 				</div> -->
			</div>
		</div>
</body>
</html>