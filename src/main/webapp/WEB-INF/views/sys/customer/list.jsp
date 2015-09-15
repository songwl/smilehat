<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>
<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${sctx}/customer" method="post">
		<div class="searchBar">
			<ul class="searchContent">
				<%-- <li><label>姓名：</label> <input type="text" name="search_RLIKE_name_OR_loginName" value="${param.search_RLIKE_name_OR_loginName}" /></li> --%>
				<li><label>登录名：</label> <input type="text" name="search_LIKE_loginName" value="${param.search_LIKE_loginName}" /></li>
				<li><label>商户类型：</label>
					<select name="search_EQ_user.userType" class="combox">
						<option value="">不限</option>
						<option value="PERSON">个人</option>
						<option value="DEALER">特约经销商</option> 
						<option value="FARMER">农场</option>  
					</select>
				</li>
				<li><label>注册时间：</label>
					<input type="text" class="date" size="9" value="${param.search_GTE_registerDate}" dateFmt="yyyy-MM-dd" name="search_GTE_registerDate" readonly="true" />
					- <input type="text" class="date" size="9" value="${param.search_LTE_registerDate}" dateFmt="yyyy-MM-dd" name="search_LTE_registerDate" readonly="true" />
				</li>
				
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">查    询</button>
							</div>
						</div></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" title="添加用户" rel="sys_customer_new" href="${sctx}/customer/new?navTabId=app_customer" target="dialog"><span>添加</span></a></li>
			<li><a class="edit" title="编辑用户" rel="sys_customer_update" href="${sctx}/customer/update/{sid}?navTabId=app_customer" target="dialog" warn="请选择一个用户"><span>编辑</span></a></li>
			<li><a title="确实要删除这些商户吗?" target="selectedTodo" rel="ids" href="${sctx}/customer/delete" class="delete"><span>删除</span></a></li>
			<li class="line">line</li>

		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>登录名(手机)</th>
				<th>商户名称</th>
				<th <tag:orderField name="userType"/>>商户类型</th>
				<th width="140" align="center" <tag:orderField name="registerDate"/>>注册时间</th>
				<th width="120">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="item" varStatus="index">
				<tr target="sid" rel="${item.id}">
					<td align="center">${index.count}</td>
					<td><input name="ids" value="${item.id}" type="checkbox"></td>
					<td><a href="${sctx}/customer/update/${item.id}" target="dialog" title="查看商户" rel="sys_customer_view"> ${item.user.loginName} </a></td>
					<td>${item.user.name}</td>
					<td><s:message code="user.usertype.${item.user.userType}"></s:message></td>
					<td><fmt:formatDate value="${item.user.registerDate}" pattern="yyyy-MM-dd HH:mm" /></td>
					<td><a title="删除 ${item.user.name}" target="ajaxTodo" href="${sctx}/customer/delete/${item.id}" class="btnDel">删除</a>
						<a title="重置密码" rel="sys_user_reset" target="dialog" href="${sctx}/user/reset/${item.user.id}" class="btnEdit">重置密码</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="navTabPageBreak({numPerPage:this.value})"></tag:pagination>
	</div>
</div>
