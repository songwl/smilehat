<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${sctx}/authority" method="post">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>授权名称：</label>
				<input type="text" name="search_LIKE_displayName" value="${param.search_LIKE_displayName}"/>
			</li>
			<li>
				<label>授权KEY：</label>
				<input type="text" name="search_LIKE_name" value="${param.search_LIKE_name}"/>
			</li>
		</ul> 
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a rel="sys_authority_new" title="添加授权"  class="add" href="${sctx}/authority/new?navTabId=sys_authority" target="dialog"><span>添加</span></a></li>
			<li><a rel="sys_authority_update" title="编辑授权"  class="edit" href="${sctx}/authority/update/{sid}" target="dialog" warn="请选择一条记录"><span>编辑</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" href="${sctx}/authority/delete" class="delete"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
			    <th width="50" align="center">序号</th>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="150" align="center"  <tag:orderField name="displayName"/>>授权名称</th>
				<th width="150" <tag:orderField name="name"/>>授权KEY</th>
				<th>资源分配</th> 
				<th width="80">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="item" varStatus="index">
				<tr target="sid" rel="${item.id}">
					<td align="center">${index.count}</td>
					<td><input name="ids" value="${item.id}" type="checkbox"></td>
					<td>
						<a href="${sctx}/authority/view/${item.id}" target="dialog" title="查看授权">${item.displayName}</a>
					</td>
					<td>${item.name}</td>
					<td><tag:fetchElementPropertyToString propertyName="value" list="${item.resourceList}"></tag:fetchElementPropertyToString>
					</td>
					<td> 
						<a title="删除${item.name}" target="ajaxTodo" href="${sctx}/authority/delete/${item.id}" class="btnDel">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="navTabPageBreak({numPerPage:this.value})"></tag:pagination>
	</div>
</div>
