<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/inc/pub/include.meta.jsp"%>
	<title>系统登录</title>
	<link rel="shortcut icon" href="${ctx}/static/images/favicon.ico" />
	<link rel="stylesheet" href="${ctx}/static/styles/base/login.css" type="text/css" />
	
	<script type="text/javascript" src="${ctx}/static/js/jquery/1.7.2/jquery.js"></script>
	<script src="${ctx}/static/js/jquery-validation/1.10.0/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/jquery-validation/poshytip/jquery.poshytip.js" type="text/javascript" ></script>
	<script type="text/javascript" charset="UTF-8" src="${ctx}/static/js/prefixfree/prefixfree.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#loginForm").validate();
		});
	</script>
</head>

<body>
	
	<div class="content">
		<div class="login-form">
		 <div class="login-img"></div>
         <form id="loginForm" action="${ctx}/login" method="post">
         	<div class="alert alert-error input-medium controls">
         	<%
			String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
			if(error != null){
			%>
				登录失败，请重试.
			<%
			} 
			%>
			</div>
             <div class="username wrap">
                 <span class="user-icon icon">u</span>
                 <input type="text" name="username" placeholder="用户名" autocomplete="on" />
             </div>
             <div class="password wrap">
				 <span class="password-icon icon">p</span>	
                 <input type="password" name="password" placeholder="*******" />
             </div>
             <div class="account-control wrap">
                 <input type="checkbox" name="rememberMe" id="rememberMe" value="true" />
                 <!--<label for="rememberMe" data-on="c" class="check"></label>-->
                 <label for="rememberMe" class="info">记住我</label>
                 <button type="submit" class="btn btn-primary">登录</button>
             </div>
         </form>
         </div>
         <div class="login-info">
         	<p class="not-registered">不提供注册功能,请联系管理员。</p>
         </div>
    </div>
</body>
</html>
