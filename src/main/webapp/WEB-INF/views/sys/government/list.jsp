  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/government" method="post">
		<div class="searchBar">
			<ul class="searchContent">
				   
<!-- 				<li><label>政府名称:</label>  -->
<%-- 					<input type="text" value="${param.search_LIKE_name}" name="search_LIKE_name" /> </li>    --%>
				<li><label>创建时间：</label>
					<input type="text" class="date" size="9" value="${param.search_GTE_createTime}" dateFmt="yyyy-MM-dd" name="search_GTE_createTime" readonly="true" />
					- <input type="text" class="date" size="9" value="${param.search_LTE_createTime}" dateFmt="yyyy-MM-dd" name="search_LTE_createTime" readonly="true" />
				</li>    
				<li><label>区域选择:</label> 
					<input type="text" value="${param.search_LIKE_region.regionName}" name="search_LIKE_region.regionName" /> </li>   
<!-- 				<li><label>REGION_DETAIL:</label>  -->
<%-- 					<input type="text" value="${param.search_LIKE_regionDetail}" name="search_LIKE_regionDetail" /> </li>       --%>
<!-- 				<li><label>CREATE_TIME:</label>  <input type="text" class="date" size="9" -->
<%-- 					value="${param.search_GTE_createTime}" dateFmt="yyyy-MM-dd" name="search_GTE_createTime" readonly="true" />- <input type="text" --%>
<%-- 					class="date" size="9" value="${param.search_LTE_createTime}" dateFmt="yyyy-MM-dd" name="search_LTE_createTime" readonly="true" /> </li>  --%>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">检索</button>
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
			<li><a class="add" title="添加" href="${ctx}/sys/government/new?navTabId=app_government" target="dialog" rel="government_new"><span>添加</span></a></li>
			<li><a class="edit" title="添加子栏目" href="${ctx}/sys/governmentcatalog/new/{sid}?navTabId=app_government" target="dialog" rel="government_catalog_update"
				warn="请选择一个记录"><span>添加子栏目</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" href="${ctx}/sys/government/delete" class="delete"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>    
				<th <tag:orderField name="name"/>>政府名称</th>   
				<th <tag:orderField name="website"/>>官方网址</th>
				<th>地区名称</th>   
				<th <tag:orderField name="regionDetail"/>>详细地址</th>   
				<th <tag:orderField name="contact"/>>联系方式</th>   
				<th <tag:orderField name="createTime"/>>创建时间</th>  
				<th width="200">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
				<tr target="sid" rel="${varitem.id}">
					<td align="center">${varindex.count}</td>
					<td><input name="ids" value="${varitem.id }" type="checkbox"></td>    
					<td> <a href="${ctx}/sys/government/update/${varitem.id}?navTabId=app_government" target="dialog" title="编辑" rel="government_update"> ${varitem.name} </a> 
					</td>   
					<td>  ${varitem.website} 
					</td>   
					<td>${varitem.region.parent.parent.regionName} ${varitem.region.parent.regionName}  ${varitem.region.regionName} 
					</td>   
					<td>  ${varitem.regionDetail}
					</td>   
					<td>${varitem.contact}
					</td>   
					<td> <fmt:formatDate value='${varitem.createTime}' pattern='yyyy-MM-dd'/> 
					</td>  
					<td><a title="编辑" target="dialog" ref="government_update" href="${ctx}/sys/government/update/${varitem.id}" class="btnEdit">编辑</a> 
						<a title="删除" target="ajaxTodo" href="${ctx}/sys/government/delete/${varitem.id}" class="btnDel">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="navTabPageBreak({numPerPage:this.value})"></tag:pagination>
	</div>
</div>
