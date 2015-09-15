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

<link rel="stylesheet" href="${ctx}/static/styles/hfive/farmDetail.css" type="text/css" />

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
			<a href="${ctx}/farm/center">
        		<img class="back" src="${ctx}/static/images/logo.png"  alt="返回">
        	</a>
		</div>
        <div class="cur_title">
        	<label  class="page-title-text">农场详情</label>
        </div>
	</header>
	<div class="pageContent">
		<form id="productForm" action="${sctx}/customer/product/list/${vm.user.id}" method="post">
			<div class="farmContent" >
				<div class="farmImg">
					<img src="${ctx}/${vm.user.photoAttach.downloadPath }">
				</div>
				<input type="hidden" name="user.id" value="${vm.user.id}">
				
				<div>名称：${vm.user.name}</div>
	
				<div>地址：${vm.region.parent.parent.regionName} ${vm.region.parent.regionName} ${vm.region.regionName} ${vm.address}</div>
				<div>
					签名：
					<textarea rows="" cols="" name="signature" style="width: 480px;"  readonly="true">${vm.signature}</textarea>
				</div>
			</div>
		</form>
		<div class="productList">
			<ul class="farmproductlist">
					
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
						$("#productList .farmproductlist").append(html);
				   }, "html");
			}
			
		});
		
	</script>
</body>
</html>