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
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<div class="row">
		<div class="span4 offset7">
			<form class="form-search" action="${ctx}/task">
			 	<label>名称：</label> <input type="text" name="search_LIKE_title" class="input-medium" value="${param.search_LIKE_title}"> 
			    <button type="submit" class="btn">Search</button>
		    </form>
	    </div>
	    <tag:sort/>
	</div>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>任务</th><th>管理</th></tr></thead>
		<tbody>
		<c:forEach items="${page.content}" var="item">
			<tr>
				<td><a href="${ctx}/task/update/${item.id}">${item.title}</a></td>
				<td><a href="${ctx}/task/view/${item.id}" class="btn btn-success">查看</a><a href="${ctx}/task/delete/${item.id}" class="btn btn-danger">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<tag:pubpagination page="${page}" url="${ctx}/task"/>

	<div><a class="btn" href="${ctx}/task/new">创建任务</a></div>
	</div>
	<%@ include file="/WEB-INF/inc/pub/include.foot.jsp"%>
</body>
</html>
