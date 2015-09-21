<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
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
		<div id="menu">
		    <ul id="nav">
		        <li><a href="${ctx}/customer/center" class="selected">基本信息</a></li>
		        <li><a href="${ctx}/customer/centerProduct" class="">我的产品</a></li>
		        <li><a href="${ctx}/customer/centerPurchase" class="">我的采购</a></li>
		    </ul>
		    <form class="login-form m-login-form" action="${ctx}/register" method="post">
			    <div id="menu_con">
				        <div class="form-group">
							登录名：${vm.user.loginName}
						 </div>
						<div class="form-group">
							商户名称：
							<div class="input-icon" style="height: 35px;">
								<input name="user.name" class="form-control" type="text" size="30" value="${vm.user.name}"  style="width: 100%;" />
							</div>
						 </div>
						<div class="form-group">
							交易地址：
							<div class="input-icon" style="height: 35px;">
								<select class="form-control combox" selectedValue="${vm.region.parent.parent.id}" ref="w_combox_city" dataUrl="${ctx}/sys/region/selectJson" refUrl="${ctx}/sys/region/selectJson?pid={value}" style="width: 27%;float: left;">
									<option value="">----省----</option> 
								</select>
								<select class="form-control combox" selectedValue="${vm.region.parent.id}" id="w_combox_city" ref="w_combox_area" refUrl="${ctx}/sys/region/selectJson?pid={value}" 
										<c:if test="${not empty vm.region.parent.parent.id}">dataUrl="${ctx}/sys/region/selectJson?pid=${vm.region.parent.parent.id}"</c:if> style="width: 27%;float: left;">
									<option value="">----市----</option> 
								</select>
								<select class="form-control combox" name="customer.regionId" selectedValue="${vm.region.id}" id="w_combox_area" <c:if test="${not empty vm.region.parent.id}">dataUrl="${ctx}/sys/region/selectJson?pid=${vm.region.parent.id}"</c:if> style="width: 27%;float: left;">
									<option value="">----区----</option> 
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="input-icon" style="height: 35px;">
								<input type="text" name="address" value="${vm.address}" class="form-control" style="width: 100%;" />
							 </div>
						 </div>
						 <div class="form-group">
							官网网址：
							<div class="input-icon" style="height: 35px;">
								<input type="text" name="website" class="form-control" value="${vm.website}" style="width: 100%;" />
							</div>
						 </div>
						<div class="form-group">
							签名：
							<div class="input-icon" style="height: 35px;">
								<input type="text" name="signature" value="${vm.signature}" class="form-control"  style="width: 100%;" />
							</div>
						 </div>
						<div class="form-group">
							详细说明：
							<div class="input-icon" style="height: 55px;">
								<textarea rows="" cols="" name="description" style="width: 100%;">${vm.description}</textarea>
							</div>
						 </div>
						
						<div class="form-actions">
							<a class="btn-submit">保存</a>
						</div>
				</div>
			</form>
		</div> 
	</div>
		
 <script src="${ctx}/static/js/hfive/custom.js"></script>
 <script src="${ctx}/static/js/hfive/combox.js"></script>
 <script>
	$(function(){
		    $("select.combox").comboxSelectRemoteData();
	});

</script>
</body>
</html>