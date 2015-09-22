<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
	<title>登录</title>
	<link rel="shortcut icon" href="${ctx}/static/images/favicon.ico" />
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/main.css">
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/normalize.css">
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
	<!-- begin mobile login form -->
	<form class="login-form m-login-form" action="${ctx}/login" method="post" id="userLogin">
		<div class="form-title clearfix">
			<a class="btn-back" href="javascript:history.back();"></a>
			<a href="${ctx}/register/guide">注册</a>
		</div>
		<!-- <div class="alert alert-danger display-hide">
			<button class="close" data-close="alert"></button>
			<span>
				 用户名或密码错误！
			</span>
		</div> -->
		<div class="form-group">
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<!-- <span class="country-num">+86</span> -->
				<input class="form-control" type="text" id="user_name" name="username" placeholder="请输入您的手机号" autocomplete="off">
			</div>
		</div>
		<div class="form-group pr">
			<div class="input-icon">
				<i class="fa fa-lock"></i>
				<input class="form-control" id="user_password" type="password" name="password" placeholder="请输入您的密码" autocomplete="off">
				<%-- <label class="control-label"><a href="${rc.contextPath}/user/findPasswordPage.do">忘记密码?</a></label> --%>
			</div>
			<%
			String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
			if(error != null){
			%>
				<div class="pwd-error pa"><i class="fa"></i>输入手机号/密码错误</div>
			<%
			} 
			%>
		</div>
		<!-- <input type="checkbox" name="rememberMe" id="rememberMe" value="true" /> -->
		<div class="form-actions">
			<button class="btn-submit pwd-submit" type="button" id="">登 录</button>
		</div>
	</form>
	<!-- end mobile login form -->
	<!--  登录类型切换 S -->
	<!-- <div class="login-type pa">
		<a class="current" href="javascript:;">手机登录</a>
		<span></span>
		<a href="javascript:;">密码登录</a>
	</div> -->
	<!-- 登录类型切换 E -->
</div>
<!-- 页面主体 E -->

</div>
<%@ include file="/WEB-INF/inc/hfive/include.systemname.jsp"%>
<script src="${ctx}/static/js/hfive/custom.js"></script>
<script>
	$(function() {

		var regex = /^0?(13|15|18|14|17)[0-9]{9}$/; //手机正则

	    $(".pwd-submit").click(function() {
	    	var username = $.trim($('#user_name').val());
		    var password = $.trim($('#user_password').val())
		    if(username == "") {
		    	C.localAlert({
					type: '',
					msg: '请输入手机号!'
				});
		    	return false;
		    } else if(username.match(regex) == null) {
		    	C.localAlert({
					type: '',
					msg: '手机号格式错误!'
				});
		    	return false;
		    } else if(password =="") {
		    	C.localAlert({
					type: '',
					msg: '请输入密码!'
				});
		    	return false;
		    }
		    $('#userLogin').submit();

		});

	})
	
</script>
</body>
</html>

