  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/certlabel" method="post">
		<div class="searchBar">
			<ul class="searchContent">
				   
				<li><label>认证标签名称:</label> 
					<input type="text" value="${param.search_LIKE_certName}" name="search_LIKE_certName" /> </li>   
				     
<!-- 				<li><label>认证类型:</label>  -->
<%-- 					<input type="text" value="${param.search_LIKE_certType}" name="search_LIKE_certType" /> </li>  --%>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">检索</button>
							</div>
						</div></li>
<%-- 					<li><a rel="app_certlabel_search" class="button" href="${ctx}/sys/certlabel/search" target="dialog" minable="false" --%>
<!-- 						fresh="false" title="高级检索"><span>高级检索</span></a></li> -->
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" title="添加" href="${ctx}/sys/certlabel/new?navTabId=app_certlabel" target="dialog" rel="certlabel_new"><span>添加</span></a></li>
			<li><a class="edit" title="编辑" href="${ctx}/sys/certlabel/update/{sid}?navTabId=app_certlabel" target="dialog" rel="certlabel_update"
				warn="请选择一个记录"><span>编辑</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" href="${ctx}/sys/certlabel/delete" class="delete"><span>删除</span></a></li>
<!-- 			<li class="line">line</li> -->
<%-- 			<li><a class="icon" href="${ctx}/sys/certlabel/export" target="dwzExport" targetType="navTab" title="确实要导出这些记录吗?"><span>导出</span></a></li> --%>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>    
				<th <tag:orderField name="certName"/>>认证标签名称</th>   
				<th <tag:orderField name="isAllowCheck"/>>是否可选择</th>   
				<th <tag:orderField name="certType"/>>认证类型</th>   
				<th width="200">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
				<tr target="sid" rel="${varitem.id}">
					<td align="center">${varindex.count}</td>
					<td><input name="ids" value="${varitem.id }" type="checkbox"></td>    
					<td> <a href="${ctx}/sys/certlabel/update/${varitem.id}?navTabId=app_certlabel" target="dialog" title="编辑"> ${varitem.certName} </a> 
					</td>   
					<td>
						 <c:if test="${ varitem.isAllowCheck==false}">否 </c:if>
						 <c:if test="${ varitem.isAllowCheck!=false}">是 </c:if>
					 </td>   
					<td>
						<s:message code="certlabel.type.${varitem.certType}" />
						<s:message code="user.usertype.${varitem.certType2}" />
					</td>   
					<td><a title="编辑" target="dialog" ref="certlabel_update" href="${ctx}/sys/certlabel/update/${varitem.id}" class="btnEdit">编辑</a> 
						<a title="删除" target="ajaxTodo" href="${ctx}/sys/certlabel/delete/${varitem.id}" class="btnDel">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="navTabPageBreak({numPerPage:this.value})"></tag:pagination>
	</div>
</div>
