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
			<a href="${ctx}/login">登录</a>
		</div>
		<div class="form-group">
			<div class="input-icon">
				<input class="" type="radio" name="userType" value="FARMER" autocomplete="off" checked="checked">农场--可查看供求信息中的联系方式，通过人工审核后能发布采购和供应信息
			</div>
		</div>
		<div class="form-group">
			<div class="input-icon">
				<input class="" type="radio" name="userType" value="DEALER" autocomplete="off">特约经销商--可查看供求信息中的联系方式，通过人工审核后能发布采购和供应信息
			</div>
		</div>
		<div class="form-group">
			<div class="input-icon">
				<input class="" type="radio" name="userType" value="PERSON" autocomplete="off"   >个人--可查看供求信息中的联系方式和发布采购信息，但无法发布供应信息
			</div>
		</div>
		<div class="form-actions">
			<a class="btn-submit" onclick="">下一步</a>
		</div>
	</form>
</div>
<!-- 页面主体 E -->

</div>
 
<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
 <script type="text/javascript">
 	$(".btn-submit").click(function(){
 		$(".login-form").submit();
 	});
 </script>

</body>
</html>
