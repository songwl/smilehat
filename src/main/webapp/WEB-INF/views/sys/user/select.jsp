<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
   
<tag:pagerForm action="#rel#" id="pagerForm" cacheName="uids"></tag:pagerForm> 
<div class="pageHeader">
	<form rel="pagerForm" method="post" action="${sctx}/user/select" onsubmit="return dwzSearch(this, 'dialog');">
		<div class="searchBar">
		   <input name="search_EQ_userType" value="${param.search_EQ_userType}" type="hidden">  	   
		   <input name="single" value="${param.single}" type="hidden">  	   
		  
		   <ul class="searchContent"> 
				<li><label>姓名：</label> <input class="textInput" name="search_LIKE_name" value="${param.search_LIKE_name}" type="text"></li>
			    <li><label>登录名：</label> <input class="textInput" name="search_LIKE_loginName" value="${param.search_LIKE_loginName}" type="text"></li>
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
								<button type="button" multLookup="uids" warn="请选择人员">选择</button>
							</div>
						</div>
					</li>
					</c:if>
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="button" onclick="javascript:$.bringBack({id:'', loginName:'',name:''})">清空</button>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<table class="table"  layoutH="108"  targetType="dialog" width="100%">
		<thead>
			<tr>
				<th width="30"><c:if test="${empty param.single}"><input type="checkbox" class="checkboxCtrl" group="ids" /></c:if></th>
				<th width="120" <tag:orderField name="loginName"/>>登录名</th>
				<th width="60" <tag:orderField name="name"/>>姓名</th>
				<th width="70" <tag:orderField name="userType"/>>账号类型</th>
				<th width="140" align="center" <tag:orderField name="createTime"/>>创建时间</th>
				<th>负责医院</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="item" varStatus="index">
				<tr>
					<td>
					<c:if test="${empty param.single}">	
					<input type="checkbox" onclick="javascript:pagePass(this,'pagerForm','uids')" name="ids" value="{id:'${item.id}', loginName:'${item.loginName}',name:'${item.name}'}" />
					</c:if>
					<c:if test="${not empty param.single}">
					<a title="查找带回" href="javascript:$.bringBack({id:'${item.id}', loginName:'${item.loginName}',name:'${item.name}'})" class="btnSelect">选择</a>
					</c:if>
					</td>
					<td><a href="${sctx}/user/view/${item.id}" target="dialog" title="查看用户" rel="sys_user_view" mask="true"> ${item.loginName} </a></td>
					<td>${item.name}</td>
					<td><s:message code="user.usertype.${item.userType}"></s:message></td>
					<td>
					 <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm"/>
					</td>
					<td><tag:fetchElementPropertyToString propertyName="name" list="${item.hospitalList}"></tag:fetchElementPropertyToString></td> 
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	<div class="panelBar">
	<tag:pagination page="${page}" targetType="dialog" numPerPageOnchange="dwzPageBreak({targetType:'dialog', data:{numPerPage:this.value}})"></tag:pagination>	 
	</div>
</div>
