  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/product" method="post">
		<div class="searchBar">
			<ul class="searchContent">
				   
				<li><label>产品名称:</label> 
					<input type="text" value="${param.search_LIKE_name}" name="search_LIKE_name" /> </li>   
<!-- 				<li><label>:</label>  -->
<%-- 					<input type="text" value="${param.search_LIKE_title}" name="search_LIKE_title" /> </li>       --%>
<!-- 				<li><label>UPDATE_TIME:</label>  <input type="text" class="date" size="9" -->
<%-- 					value="${param.search_GTE_updateTime}" dateFmt="yyyy-MM-dd" name="search_GTE_updateTime" readonly="true" />- <input type="text" --%>
<%-- 					class="date" size="9" value="${param.search_LTE_updateTime}" dateFmt="yyyy-MM-dd" name="search_LTE_updateTime" readonly="true" /> </li>    --%>
				<li><label>发布时间:</label>  <input type="text" class="date" size="9"
					value="${param.search_GTE_publishTime}" dateFmt="yyyy-MM-dd" name="search_GTE_publishTime" readonly="true" />- <input type="text"
					class="date" size="9" value="${param.search_LTE_publishTime}" dateFmt="yyyy-MM-dd" name="search_LTE_publishTime" readonly="true" /> </li>      
<!-- 				<li><label>BRANCH_INFO:</label>  -->
<%-- 					<input type="text" value="${param.search_LIKE_branchInfo}" name="search_LIKE_branchInfo" /> </li>    --%>
<!-- 				<li><label>PRICE_UNIT:</label>  -->
<%-- 					<input type="text" value="${param.search_LIKE_priceUnit}" name="search_LIKE_priceUnit" /> </li>       --%>
<!-- 				<li><label>QUANTITY_UNIT:</label>  -->
<%-- 					<input type="text" value="${param.search_LIKE_quantityUnit}" name="search_LIKE_quantityUnit" /> </li>    --%>
				<li><label>区域名称:</label> 
					<input type="text" value="${param.search_LIKE_region.regionName}" name="search_LIKE_region.regionName" /> </li>      
				<li><label>产品品类:</label> 
					<input type="text" value="${param.search_LIKE_category.categoryName}" name="search_LIKE_category.categoryName" /> </li> 
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">检索</button>
							</div>
						</div></li>
<%-- 					<li><a rel="_product_search" class="button" href="${ctx}/sys/product/search" target="dialog" minable="false" --%>
<!-- 						fresh="false" title="高级检索"><span>高级检索</span></a></li> -->
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" title="添加" href="${ctx}/sys/product/new?navTabId=_product" target="dialog" rel="product_new"><span>添加</span></a></li>
			<li><a class="edit" title="编辑" href="${ctx}/sys/product/update/{sid}?navTabId=_product" target="dialog" rel="product_update"
				warn="请选择一个记录"><span>编辑</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" href="${ctx}/sys/product/delete" class="delete"><span>删除</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="${ctx}/sys/product/export" target="dwzExport" targetType="navTab" title="确实要导出这些记录吗?"><span>导出</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>    
				<th <tag:orderField name="name"/>>产品名称</th>   
				<th <tag:orderField name="title"/>>产品标题</th>   
				<th <tag:orderField name="description"/>>产品描述</th>   
				<th <tag:orderField name="createTime"/>>创建时间</th>   
				<th <tag:orderField name="updateTime"/>>更新时间</th>   
				<th <tag:orderField name="publishTime"/>>发布时间</th>   
				<th <tag:orderField name="startTime"/>>上市开始时间</th>   
				<th <tag:orderField name="endTime"/>>上市结束时间</th>   
				<th <tag:orderField name="branchInfo"/>>规格</th>   
				<th <tag:orderField name="price"/>>价格</th>   
				<th <tag:orderField name="priceUnit"/>>价格单位</th>   
				<th <tag:orderField name="quantity"/>>供应量</th>   
				<th <tag:orderField name="quantityUnit"/>>供应量单位</th>   
				<th <tag:orderField name="region.regionName"/>>区域名称</th>   
				<th <tag:orderField name="regionDetail"/>>详细地址</th>   
				<th <tag:orderField name="userId"/>>user_id</th>   
				<th <tag:orderField name="category.categoryName"/>>品类名称</th>  
				<th width="200">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
				<tr target="sid" rel="${varitem.id}">
					<td align="center">${varindex.count}</td>
					<td><input name="ids" value="${varitem.id }" type="checkbox"></td>    
					<td> <a href="${ctx}/sys/product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.name} </a> 
					</td>   
					<td> <a href="${ctx}/sys/product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.title} </a> 
					</td>   
					<td> <a href="${ctx}/sys/product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.description} </a> 
					</td>   
					<td> <fmt:formatDate value='${ varitem.createTime}' pattern='yyyy-MM-dd'/> 
					</td>   
					<td> <fmt:formatDate value='${ varitem.updateTime}' pattern='yyyy-MM-dd'/> 
					</td>   
					<td> <fmt:formatDate value='${ varitem.publishTime}' pattern='yyyy-MM-dd'/> 
					</td>   
					<td> <fmt:formatDate value='${ varitem.startTime}' pattern='yyyy-MM-dd'/> 
					</td>   
					<td> <fmt:formatDate value='${ varitem.endTime}' pattern='yyyy-MM-dd'/> 
					</td>   
					<td> <a href="${ctx}/sys/product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.branchInfo} </a> 
					</td>   
					<td> <a href="${ctx}/sys/product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.price} </a> 
					</td>  
					<td> <a href="${ctx}/sys/product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.priceUnit} </a> 
					</td>   
					<td> <a href="${ctx}/sys/product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.quantity} </a> 
					</td>   
					<td> <a href="${ctx}/sys/product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.quantityUnit} </a> 
					</td>   
					<td> <a href="${ctx}/sys/product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.regionId} </a> 
					</td>   
					<td> <a href="${ctx}/sys/product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.regionDetail} </a> 
					</td>   
					<td> <a href="${ctx}/sys/product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.userId} </a> 
					</td>   
					<td> <a href="${ctx}/sys/product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.categoryId} </a> 
					</td>  
					<td><a title="编辑" target="dialog" ref="product_update" href="${ctx}/sys/product/update/${varitem.id}" class="btnEdit">编辑</a> <a title="删除"
						target="ajaxTodo" href="${ctx}/sys/product/delete/${varitem.id}" class="btnDel">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="navTabPageBreak({numPerPage:this.value})"></tag:pagination>
	</div>
</div>
