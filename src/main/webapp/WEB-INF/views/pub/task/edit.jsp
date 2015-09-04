<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>

<html>
<head>
	<%@ include file="/WEB-INF/inc/pub/include.meta.jsp"%>
	<title>任务管理</title>
	<%@ include file="/WEB-INF/inc/pub/include.css.jsp"%>
	<%@ include file="/WEB-INF/inc/pub/include.js.jsp"%>
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#task_title").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</head>

<body>
	<%@ include file="/WEB-INF/inc/pub/include.head.jsp"%>
	<div class="wth">
	<form id="inputForm" action="${ctx}/task/${action}" method="post" class="form-horizontal">
		<tag:token tokenName="task_new" />
		<input type="hidden" name="id" value="${vm.id}"/>
		<fieldset>
			<legend><small>管理任务</small></legend>
			<div class="control-group">
				<label for="task_title" class="control-label">任务名称:</label>
				<div class="controls">
					<input type="text" id="task_title" name="title"  value="${vm.title}" class="input-large required" minlength="3"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label">任务描述:</label>
				<div class="controls">
					<textarea id="description" name="description" class="input-large">${vm.description}</textarea>
				</div>
			</div>	
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</fieldset>
	</form>
	</div>
	<%@ include file="/WEB-INF/inc/pub/include.foot.jsp"%>
</body>
</html>
