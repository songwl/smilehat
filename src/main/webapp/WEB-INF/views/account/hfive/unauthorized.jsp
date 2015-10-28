<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
	<title>手机号注册</title>
	
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css">
	<<link rel="stylesheet" href="${ctx}/static/styles/hfive/normalize.css">
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/custom.css">
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/login.css">
	
	<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>
</head>
<body class="user-page" onselectstart="return!1">
<div class="zhezhao">
</div>

<div class="wrap clearfix">

<!-- 页面主体 S -->
<div class="content">


	<!-- begin login form -->
	<form class="login-form m-login-form" action="${ctx}/register" method="get">
		<div class="form-title clearfix">
			<a class="btn-back" href="javascript:history.back();"></a>
		</div>
		
		<div style="color: #fff;">您没有该操作的访问授权！！！</div>
		
		<div class="form-actions ">
			<a class="btn-submit" href="${ctx}/trading">返回交易中心</a>
		</div>
		</br>
		</br>
		<div class="form-actions">
			<a class="btn-submit" href="${ctx}/login">登录</a>
		</div>
	</form>
</div>
<!-- 页面主体 E -->

</div>
 
<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>

</body>
</html>
