  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}//governmentcatalog" method="post">
		<div class="searchBar">
			<ul class="searchContent">
				   
				<li><label>GOVERNMENT_ID:</label> 
					<input type="text" value="${param.search_LIKE_governmentId}" name="search_LIKE_governmentId" /> </li>   
				<li><label>CATALOG_NAME:</label> 
					<input type="text" value="${param.search_LIKE_catalogName}" name="search_LIKE_catalogName" /> </li>      
				<li><label>CREATE_TIME:</label>  <input type="text" class="date" size="9"
					value="${param.search_GTE_createTime}" dateFmt="yyyy-MM-dd" name="search_GTE_createTime" readonly="true" />- <input type="text"
					class="date" size="9" value="${param.search_LTE_createTime}" dateFmt="yyyy-MM-dd" name="search_LTE_createTime" readonly="true" /> </li> 
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">检索</button>
							</div>
						</div></li>
					<li><a rel="_governmentcatalog_search" class="button" href="${ctx}//governmentcatalog/search" target="dialog" minable="false"
						fresh="false" title="高级检索"><span>高级检索</span></a></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" title="添加" href="${ctx}//governmentcatalog/new?navTabId=_governmentcatalog" target="dialog" rel="governmentcatalog_new"><span>添加</span></a></li>
			<li><a class="edit" title="编辑" href="${ctx}//governmentcatalog/update/{sid}?navTabId=_governmentcatalog" target="dialog" rel="governmentcatalog_update"
				warn="请选择一个记录"><span>编辑</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" href="${ctx}//governmentcatalog/delete" class="delete"><span>删除</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="${ctx}//governmentcatalog/export" target="dwzExport" targetType="navTab" title="确实要导出这些记录吗?"><span>导出</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>    
				<th <tag:orderField name="governmentId"/>>government_id</th>   
				<th <tag:orderField name="catalogName"/>>catalog_name</th>   
				<th <tag:orderField name="description"/>>description</th>   
				<th <tag:orderField name="attachId"/>>attach_id</th>   
				<th <tag:orderField name="createTime"/>>create_time</th>  
				<th width="200">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
				<tr target="sid" rel="${varitem.id}">
					<td align="center">${varindex.count}</td>
					<td><input name="ids" value="${varitem.id }" type="checkbox"></td>    
					<td> <a href="${ctx}//governmentcatalog/view/${varitem.id}" target="dialog" title="查看"> ${varitem.governmentId} </a> 
					</td>   
					<td> <a href="${ctx}//governmentcatalog/view/${varitem.id}" target="dialog" title="查看"> ${varitem.catalogName} </a> 
					</td>   
					<td> <a href="${ctx}//governmentcatalog/view/${varitem.id}" target="dialog" title="查看"> ${varitem.description} </a> 
					</td>   
					<td> <a href="${ctx}//governmentcatalog/view/${varitem.id}" target="dialog" title="查看"> ${varitem.attachId} </a> 
					</td>   
					<td> <fmt:formatDate value='${ varitem.createTime}' pattern='yyyy-MM-dd'/> 
					</td>  
					<td><a title="编辑" target="dialog" ref="governmentcatalog_update" href="${ctx}//governmentcatalog/update/${varitem.id}" class="btnEdit">编辑</a> <a title="删除"
						target="ajaxTodo" href="${ctx}//governmentcatalog/delete/${varitem.id}" class="btnDel">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="navTabPageBreak({numPerPage:this.value})"></tag:pagination>
	</div>
</div>
