<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%> 
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm> 
<div class="pageHeader">
	<form rel="pagerForm" method="post" action="${sctx}/authority/select" onsubmit="return dwzSearch(this, 'dialog');">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>授权名称：</label> <input class="textInput" name="search_LIKE_displayName" value="${param.search_LIKE_displayName}" type="text"></li>
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
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="button" multLookup="ids" warn="请选择资源">选择</button>
							</div>
						</div>
					</li>
					<li>
						<div class="button">
							<div class="buttonContent">
								<button type="button" onclick="javascript:$.bringBack({id:'', displayName:'',name:''})">清空</button>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<table class="table" layoutH="118" targetType="dialog" width="100%">
		<thead>
			<tr>
				<th width="30"><input type="checkbox" class="checkboxCtrl" group="ids" /></th>
				<th <tag:orderField name="displayName"/>>授权名称</th>
				<th <tag:orderField name="name"/>>授权KEY</th>
				<th>资源分配</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="item" varStatus="index">
				<tr>
					<td><input type="checkbox" name="ids" value="{id:'${item.id}', displayName:'${item.displayName}',name:'${item.name}'}" /></td>
					<td>${item.displayName}</td>
					<td>${item.name}</td> 
					<td><tag:fetchElementPropertyToString propertyName="value" list="${item.resourceList}"></tag:fetchElementPropertyToString></td> 
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	<div class="panelBar">
	<tag:pagination page="${page}" targetType="dialog" numPerPageOnchange="dwzPageBreak({targetType:'dialog', data:{numPerPage:this.value}})"></tag:pagination>	 
	</div>
</div>
