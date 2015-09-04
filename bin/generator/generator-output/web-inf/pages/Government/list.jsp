  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}//government" method="post">
		<div class="searchBar">
			<ul class="searchContent">
				   
				<li><label>NAME:</label> 
					<input type="text" value="${param.search_LIKE_name}" name="search_LIKE_name" /> </li>   
				<li><label>INTRODUCTION:</label> 
					<input type="text" value="${param.search_LIKE_introduction}" name="search_LIKE_introduction" /> </li>      
				<li><label>REGION_ID:</label> 
					<input type="text" value="${param.search_LIKE_regionId}" name="search_LIKE_regionId" /> </li>   
				<li><label>REGION_DETAIL:</label> 
					<input type="text" value="${param.search_LIKE_regionDetail}" name="search_LIKE_regionDetail" /> </li>      
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
					<li><a rel="_government_search" class="button" href="${ctx}//government/search" target="dialog" minable="false"
						fresh="false" title="高级检索"><span>高级检索</span></a></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" title="添加" href="${ctx}//government/new?navTabId=_government" target="dialog" rel="government_new"><span>添加</span></a></li>
			<li><a class="edit" title="编辑" href="${ctx}//government/update/{sid}?navTabId=_government" target="dialog" rel="government_update"
				warn="请选择一个记录"><span>编辑</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" href="${ctx}//government/delete" class="delete"><span>删除</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="${ctx}//government/export" target="dwzExport" targetType="navTab" title="确实要导出这些记录吗?"><span>导出</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>    
				<th <tag:orderField name="name"/>>name</th>   
				<th <tag:orderField name="introduction"/>>introduction</th>   
				<th <tag:orderField name="description"/>>description</th>   
				<th <tag:orderField name="website"/>>website</th>   
				<th <tag:orderField name="regionId"/>>region_id</th>   
				<th <tag:orderField name="regionDetail"/>>region_detail</th>   
				<th <tag:orderField name="contact"/>>contact</th>   
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
					<td> <a href="${ctx}//government/view/${varitem.id}" target="dialog" title="查看"> ${varitem.name} </a> 
					</td>   
					<td> <a href="${ctx}//government/view/${varitem.id}" target="dialog" title="查看"> ${varitem.introduction} </a> 
					</td>   
					<td> <a href="${ctx}//government/view/${varitem.id}" target="dialog" title="查看"> ${varitem.description} </a> 
					</td>   
					<td> <a href="${ctx}//government/view/${varitem.id}" target="dialog" title="查看"> ${varitem.website} </a> 
					</td>   
					<td> <a href="${ctx}//government/view/${varitem.id}" target="dialog" title="查看"> ${varitem.regionId} </a> 
					</td>   
					<td> <a href="${ctx}//government/view/${varitem.id}" target="dialog" title="查看"> ${varitem.regionDetail} </a> 
					</td>   
					<td> <a href="${ctx}//government/view/${varitem.id}" target="dialog" title="查看"> ${varitem.contact} </a> 
					</td>   
					<td> <a href="${ctx}//government/view/${varitem.id}" target="dialog" title="查看"> ${varitem.attachId} </a> 
					</td>   
					<td> <fmt:formatDate value='${ varitem.createTime}' pattern='yyyy-MM-dd'/> 
					</td>  
					<td><a title="编辑" target="dialog" ref="government_update" href="${ctx}//government/update/${varitem.id}" class="btnEdit">编辑</a> <a title="删除"
						target="ajaxTodo" href="${ctx}//government/delete/${varitem.id}" class="btnDel">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="navTabPageBreak({numPerPage:this.value})"></tag:pagination>
	</div>
</div>
