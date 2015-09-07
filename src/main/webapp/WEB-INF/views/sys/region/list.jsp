  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/region" method="post">
		<div class="searchBar">
			<ul class="searchContent">
<!-- 				<li><label>REGION_CODE:</label>  -->
<%-- 					<input type="text" value="${param.search_LIKE_regionCode}" name="search_LIKE_regionCode" /> </li>    --%>
				<li><label>区域名称:</label> 
					<input type="text" value="${param.search_LIKE_regionName}" name="search_LIKE_regionName" /> </li>      
<!-- 				<li><label>REGION_SORT:</label>  -->
<%-- 					<input type="text" value="${param.search_LIKE_regionSort}" name="search_LIKE_regionSort" /> </li>    --%>
				<li><label>区域英文缩写:</label> 
					<input type="text" value="${param.search_LIKE_regionShortnameEn}" name="search_LIKE_regionShortnameEn" /> </li>   
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">检索</button>
							</div>
						</div></li>
<%-- 					<li><a rel="sys_region_search" class="button" href="${ctx}/sys/region/search" target="dialog" minable="false" --%>
<!-- 						fresh="false" title="高级检索"><span>高级检索</span></a></li> -->
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" title="添加" href="${ctx}/sys/region/new?navTabId=sys_region" target="dialog" rel="region_new"><span>添加</span></a></li>
			<li><a class="edit" title="编辑" href="${ctx}/sys/region/update/{sid}?navTabId=sys_region" target="dialog" rel="region_update"
				warn="请选择一个记录"><span>编辑</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" href="${ctx}/sys/region/delete" class="delete"><span>删除</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="${ctx}/sys/region/export" target="dwzExport" targetType="navTab" title="确实要导出这些记录吗?"><span>导出</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="163">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>    
				<th <tag:orderField name="regionCode"/>>区域代码</th>   
				<th <tag:orderField name="regionName"/>>区域名称</th>   
				<th <tag:orderField name="parent.regionName"/>>上级区域名称</th>   
<!-- 				<th <tag:orderField name="regionLevel"/>>区域等级</th>    -->
<!-- 				<th <tag:orderField name="regionSort"/>>区域顺序</th>    -->
				<th <tag:orderField name="regionNameEn"/>>区域英文名称</th>   
				<th <tag:orderField name="regionShortnameEn"/>>区域英文缩写</th>  
				<th width="200">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
				<tr target="sid" rel="${varitem.id}">
					<td align="center">${varindex.count}</td>
					<td><input name="ids" value="${varitem.id }" type="checkbox"></td>    
					<td> <a href="${ctx}/sys/region/view/${varitem.id}" target="dialog" title="查看"> ${varitem.regionCode} </a> 
					</td>   
					<td> <a href="${ctx}/sys/region/view/${varitem.id}" target="dialog" title="查看"> ${varitem.regionName} </a> 
					</td>   
					<td> <a href="${ctx}/sys/region/view/${varitem.id}" target="dialog" title="查看"> ${varitem.parent.regionName} </a> 
					</td>   
<%-- 					<td> <a href="${ctx}/sys/region/view/${varitem.id}" target="dialog" title="查看"> ${varitem.regionLevel} </a>  --%>
<!-- 					</td>    -->
<%-- 					<td> <a href="${ctx}/sys/region/view/${varitem.id}" target="dialog" title="查看"> ${varitem.regionSort} </a>  --%>
<!-- 					</td>    -->
					<td> <a href="${ctx}/sys/region/view/${varitem.id}" target="dialog" title="查看"> ${varitem.regionNameEn} </a> 
					</td>   
					<td> <a href="${ctx}/sys/region/view/${varitem.id}" target="dialog" title="查看"> ${varitem.regionShortnameEn} </a> 
					</td>  
					<td><a title="编辑" target="dialog" ref="region_update" href="${ctx}/sys/region/update/${varitem.id}" class="btnEdit">编辑</a> <a title="删除"
						target="ajaxTodo" href="${ctx}/sys/region/delete/${varitem.id}" class="btnDel">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="navTabPageBreak({numPerPage:this.value})"></tag:pagination>
	</div>
</div>
