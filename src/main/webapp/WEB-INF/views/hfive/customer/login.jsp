<%@ page language="java" contentType="text/html; charset=utf-8"    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<!DOCTYPE html >
<html>
<head>
	<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
	<title>微笑草帽</title>
	
	<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>
	<link rel="stylesheet" href="${ctx}/static/styles/hfive/login.css" type="text/css" />
	
	<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>
	
</head>
<body>
<div class="fill_text">
        <div class="item">
            <label>手机号</label>
            <input type="text" class="tex" id="loginname" name="loginname">
            <div></div>
        </div>
        <div class="item">
            <label>密码</label>
            <input type="password" class="tex" id="password" name="pwd">
            <div></div>
        </div>
 		<div class="item">
            <label>&nbsp;&nbsp;</label>
            <span class="error_text" style="color:red;"></span>
            <div></div>
        </div>
        <div class="d_area">
            <a href="" id="btn-submit" class="bigbtn">登录</a>
            <a href="" id="btn-register" class="bigbtn">注册</a>
        </div>
    </div>
</body>
</html>