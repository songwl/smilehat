<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
   
<tag:pagerForm action="#rel#" id="pagerForm" cacheName="uids"></tag:pagerForm> 
<div class="pageHeader">
	<form rel="pagerForm" method="post" action="${sctx}/product/select" onsubmit="return dwzSearch(this, 'dialog');">
		<div class="searchBar">
		   <input name="single" value="${param.single}" type="hidden">  	   
		  
		   <ul class="searchContent"> 
		   		<li><label>姓名：</label> <input type="text" name="search_RLIKE_name_OR_loginName" value="${param.search_RLIKE_name_OR_loginName}" /></li>
				<li><label>登录名：</label> <input type="text" name="search_LIKE_loginName" value="${param.search_LIKE_loginName}" /></li>
		   
			</ul>
			<div class="subBar">
				<ul>
					<li>
						<div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">查询</button>
							</div>
						</div>
					</li>
					<c:if test="${empty param.single}">					
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="button" multLookup="uids" warn="请选择商户">选择</button>
							</div>
						</div>
					</li>
					</c:if>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>登录名(手机)</th>
				<th>称呼</th>
				<th <tag:orderField name="userType"/>>商户类型</th>
				<th width="140" align="center" <tag:orderField name="registerDate"/>>注册时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="item" varStatus="index">
				<tr target="sid" rel="${item.id}">
					<td align="center">${index.count}</td>
					<td>
						<c:if test="${empty param.single}">	
						<input type="checkbox" onclick="javascript:pagePass(this,'pagerForm','uids')" name="ids" value="{id:'${item.user.id}', loginName:'${item.user.loginName}',name:'${item.user.name}'}" />
						</c:if>
						<c:if test="${not empty param.single}">
						<a title="查找带回" href="javascript:$.bringBack({id:'${item.user.id}', loginName:'${item.user.loginName}',name:'${item.user.name}'})" class="btnSelect">选择</a>
						</c:if>
					</td>
					<td><a href="${sctx}/customer/view/${item.id}" target="dialog" title="查看商户" rel="sys_customer_view"> ${item.user.loginName} </a></td>
					<td>${item.user.name}</td>
					<td><s:message code="user.usertype.${item.user.userType}"></s:message></td>
					<td><fmt:formatDate value="${item.user.registerDate}" pattern="yyyy-MM-dd HH:mm" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="navTabPageBreak({numPerPage:this.value})"></tag:pagination>
	</div>
</div>
