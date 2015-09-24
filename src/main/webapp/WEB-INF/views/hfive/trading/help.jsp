<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/inc/hfive/include.meta.jsp"%>
<%@ include file="/WEB-INF/inc/hfive/include.css.jsp"%>

<%@ include file="/WEB-INF/inc/hfive/include.js.jsp"%>

<link rel="stylesheet" href="${ctx}/static/styles/hfive/help.css" type="text/css" />

<title>微笑草帽</title>
</head>
<body>
	<div class="background-img">
	</div>
	<div class="main-div">
		<div class="img-div">
			<img class="helpimg" src="/smilehat/static/images/help2.png" alt="帮助">
		</div>
		<div class="mian-content">
			您有疑问请致电
		</div>
		<div class="time-div">
			AM 9:00-PM 6:00		
		</div>
		<div class="phone-div">
			021&nbsp;6234&nbsp;8888
		</div>
	</div>
	<div class="back">
     	<a href="javascript:history.back(-1);">
      		<img class="search-img" src="/smilehat/static/images/back1.png" alt="返回">
     	</a>
    </div>
		
</body>
</html>