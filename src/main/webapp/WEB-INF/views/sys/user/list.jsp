<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${sctx}/user" method="post">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>姓名：</label> <input type="text" name="search_RLIKE_name_OR_loginName" value="${param.search_RLIKE_name_OR_loginName}" /></li>
				<li><label>登录名：</label> <input type="text" name="search_LIKE_loginName" value="${param.search_LIKE_loginName}" /></li>

			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">检索</button>
							</div>
						</div></li>
					<!--  
					<li><a rel="sys_user_search" class="button" href="${ctx}/sys/user/search" target="dialog" minable="false" fresh="false" title="高级检索"><span>高级检索</span></a></li>-->
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" title="添加用户" rel="sys_user_new" href="${sctx}/user/new?navTabId=sys_user" target="dialog"><span>添加</span></a></li>
			<li><a class="edit" title="编辑用户" rel="sys_user_update" href="${sctx}/user/update/{sid}?navTabId=sys_user" target="dialog" warn="请选择一个用户"><span>编辑</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" href="${sctx}/user/delete" class="delete"><span>删除</span></a></li>
			<li class="line">line</li>

		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th <tag:orderField name="loginName"/>>登录名</th>
				<th <tag:orderField name="name"/>>姓名</th>
				<th <tag:orderField name="userType"/>>使用状态</th>
				<th width="140" align="center" <tag:orderField name="createTime"/>>创建时间</th>
				<th width="120">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="item" varStatus="index">
				<tr target="sid" rel="${item.id}">
					<td align="center">${index.count}</td>
					<td><input name="ids" value="${item.id}" type="checkbox"></td>
					<td><a href="${sctx}/user/view/${item.id}" target="dialog" title="查看用户" rel="sys_user_view"> ${item.loginName} </a></td>
					<td>${item.name}</td>
					<td><s:message code="user.isenabled.${item.isEnabled}"></s:message></td>
					<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm" /></td>
					<td><a title="重置密码" rel="sys_user_reset" target="dialog" href="${ctx}/sys/user/reset/${item.id}" class="btnEdit">重置密码</a> <a title="删除 ${item.name}" target="ajaxTodo"
						href="${sctx}/user/delete/${item.id}" class="btnDel">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="navTabPageBreak({numPerPage:this.value})"></tag:pagination>
	</div>
</div>
