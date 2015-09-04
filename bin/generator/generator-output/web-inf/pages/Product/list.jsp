  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}//product" method="post">
		<div class="searchBar">
			<ul class="searchContent">
				   
				<li><label>NAME:</label> 
					<input type="text" value="${param.search_LIKE_name}" name="search_LIKE_name" /> </li>   
				<li><label>TITLE:</label> 
					<input type="text" value="${param.search_LIKE_title}" name="search_LIKE_title" /> </li>      
				<li><label>UPDATE_TIME:</label>  <input type="text" class="date" size="9"
					value="${param.search_GTE_updateTime}" dateFmt="yyyy-MM-dd" name="search_GTE_updateTime" readonly="true" />- <input type="text"
					class="date" size="9" value="${param.search_LTE_updateTime}" dateFmt="yyyy-MM-dd" name="search_LTE_updateTime" readonly="true" /> </li>   
				<li><label>PUBLISH_TIME:</label>  <input type="text" class="date" size="9"
					value="${param.search_GTE_publishTime}" dateFmt="yyyy-MM-dd" name="search_GTE_publishTime" readonly="true" />- <input type="text"
					class="date" size="9" value="${param.search_LTE_publishTime}" dateFmt="yyyy-MM-dd" name="search_LTE_publishTime" readonly="true" /> </li>      
				<li><label>BRANCH_INFO:</label> 
					<input type="text" value="${param.search_LIKE_branchInfo}" name="search_LIKE_branchInfo" /> </li>   
				<li><label>PRICE_UNIT:</label> 
					<input type="text" value="${param.search_LIKE_priceUnit}" name="search_LIKE_priceUnit" /> </li>      
				<li><label>QUANTITY_UNIT:</label> 
					<input type="text" value="${param.search_LIKE_quantityUnit}" name="search_LIKE_quantityUnit" /> </li>   
				<li><label>REGION_ID:</label> 
					<input type="text" value="${param.search_LIKE_regionId}" name="search_LIKE_regionId" /> </li>      
				<li><label>CATEGORY_ID:</label> 
					<input type="text" value="${param.search_LIKE_categoryId}" name="search_LIKE_categoryId" /> </li> 
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">检索</button>
							</div>
						</div></li>
					<li><a rel="_product_search" class="button" href="${ctx}//product/search" target="dialog" minable="false"
						fresh="false" title="高级检索"><span>高级检索</span></a></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" title="添加" href="${ctx}//product/new?navTabId=_product" target="dialog" rel="product_new"><span>添加</span></a></li>
			<li><a class="edit" title="编辑" href="${ctx}//product/update/{sid}?navTabId=_product" target="dialog" rel="product_update"
				warn="请选择一个记录"><span>编辑</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" href="${ctx}//product/delete" class="delete"><span>删除</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="${ctx}//product/export" target="dwzExport" targetType="navTab" title="确实要导出这些记录吗?"><span>导出</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>    
				<th <tag:orderField name="name"/>>name</th>   
				<th <tag:orderField name="title"/>>title</th>   
				<th <tag:orderField name="description"/>>description</th>   
				<th <tag:orderField name="createTime"/>>create_time</th>   
				<th <tag:orderField name="updateTime"/>>update_time</th>   
				<th <tag:orderField name="publishTime"/>>publish_time</th>   
				<th <tag:orderField name="startTime"/>>start_time</th>   
				<th <tag:orderField name="endTime"/>>end_time</th>   
				<th <tag:orderField name="branchInfo"/>>branch_info</th>   
				<th <tag:orderField name="priceUnit"/>>price_unit</th>   
				<th <tag:orderField name="price"/>>price</th>   
				<th <tag:orderField name="quantity"/>>quantity</th>   
				<th <tag:orderField name="quantityUnit"/>>quantity_unit</th>   
				<th <tag:orderField name="regionId"/>>region_id</th>   
				<th <tag:orderField name="regionDetail"/>>region_detail</th>   
				<th <tag:orderField name="userId"/>>user_id</th>   
				<th <tag:orderField name="categoryId"/>>category_id</th>  
				<th width="200">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
				<tr target="sid" rel="${varitem.id}">
					<td align="center">${varindex.count}</td>
					<td><input name="ids" value="${varitem.id }" type="checkbox"></td>    
					<td> <a href="${ctx}//product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.name} </a> 
					</td>   
					<td> <a href="${ctx}//product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.title} </a> 
					</td>   
					<td> <a href="${ctx}//product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.description} </a> 
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
					<td> <a href="${ctx}//product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.branchInfo} </a> 
					</td>   
					<td> <a href="${ctx}//product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.priceUnit} </a> 
					</td>   
					<td> <a href="${ctx}//product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.price} </a> 
					</td>   
					<td> <a href="${ctx}//product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.quantity} </a> 
					</td>   
					<td> <a href="${ctx}//product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.quantityUnit} </a> 
					</td>   
					<td> <a href="${ctx}//product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.regionId} </a> 
					</td>   
					<td> <a href="${ctx}//product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.regionDetail} </a> 
					</td>   
					<td> <a href="${ctx}//product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.userId} </a> 
					</td>   
					<td> <a href="${ctx}//product/view/${varitem.id}" target="dialog" title="查看"> ${varitem.categoryId} </a> 
					</td>  
					<td><a title="编辑" target="dialog" ref="product_update" href="${ctx}//product/update/${varitem.id}" class="btnEdit">编辑</a> <a title="删除"
						target="ajaxTodo" href="${ctx}//product/delete/${varitem.id}" class="btnDel">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="navTabPageBreak({numPerPage:this.value})"></tag:pagination>
	</div>
</div>
