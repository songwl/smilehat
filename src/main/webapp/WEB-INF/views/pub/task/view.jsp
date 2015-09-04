<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<html>
<head>
	<%@ include file="/WEB-INF/inc/pub/include.meta.jsp"%>
	<title>任务管理</title>
	<%@ include file="/WEB-INF/inc/pub/include.css.jsp"%>
	<%@ include file="/WEB-INF/inc/pub/include.js.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/inc/pub/include.head.jsp"%>
	<div class="wth">
		<fieldset>
			<legend><small>管理任务</small></legend>
			<div class="control-group">
				<label for="task_title" class="control-label">任务名称:</label>
				<div class="controls">${vm.title}
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label">任务描述:</label>
				<div class="controls">
					<p>${vm.description}</p>
				</div>
			</div>	
			<div class="form-actions">
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</fieldset>
		</div>
	<%@ include file="/WEB-INF/inc/pub/include.foot.jsp"%>
</body>
</html>
