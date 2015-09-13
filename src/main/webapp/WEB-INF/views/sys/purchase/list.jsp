  <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/inc/include.inc.jsp"%>
<tag:pagerForm action="#rel#" id="pagerForm"></tag:pagerForm>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/purchase" method="post">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>商户选择:</label> 
				<dd>
					<div style="float:left;">
					<input value="${param.search_IN_user.id}" name="search_IN_user.id" type="hidden" /> 
					<input value="${param.search_IN_user.name}" name="search_IN_user.name" /> </div>
					<a class="btnLook" rel="customer_select" title="选择商户" href="${ctx}/sys/customer/select" lookupGroup="search_IN_user">查找带回</a>
				</dd>
				<li><label>发布时间:</label>  <input type="text" class="date" size="9"
					value="${param.search_GTE_publishTime}" dateFmt="yyyy-MM-dd" name="search_GTE_publishTime" readonly="true" />- <input type="text"
					class="date" size="9" value="${param.search_LTE_publishTime}" dateFmt="yyyy-MM-dd" name="search_LTE_publishTime" readonly="true" /> </li>   
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
			<li><a class="add" title="添加" href="${ctx}/sys/purchase/new?navTabId=app_purchase" target="dialog" rel="purchase_new"><span>添加</span></a></li>
<%-- 			<li><a class="edit" title="编辑" href="${ctx}/sys/purchase/update/{sid}?navTabId=app_purchase" target="dialog" rel="purchase_update" --%>
<!-- 				warn="请选择一个记录"><span>编辑</span></a></li> -->
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" href="${ctx}/sys/purchase/delete" class="delete"><span>删除</span></a></li>
			<li class="line">line</li>
<%-- 			<li><a class="icon" href="${ctx}/sys/purchase/export" target="dwzExport" targetType="navTab" title="确实要导出这些记录吗?"><span>导出</span></a></li> --%>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="40" align="center">序号</th>
				<th width="30"><input type="checkbox" group="ids" class="checkboxCtrl"></th>    
				<th <tag:orderField name="user.name"/>>商户名称</th>   
				<th <tag:orderField name="category.categoryName"/>>品类名称</th>   
				<th <tag:orderField name="title"/>>标题</th>   
				<th <tag:orderField name="quantity"/>>采购量(单位)</th>   
				<th <tag:orderField name="price"/>>采购价格(单位)</th>   
				<th <tag:orderField name="publishTime"/>>发布时间</th>  
				<th width="200">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.content}" var="varitem" varStatus="varindex">
				<tr target="sid" rel="${varitem.id}">
					<td align="center">${varindex.count}</td>
					<td><input name="ids" value="${varitem.id }" type="checkbox"></td>    
					<td> ${varitem.user.name} 
					</td>   
					<td> ${varitem.category.categoryName} 
					</td>   
					<td> <a href="${ctx}/sys/purchase/update/${varitem.id}?navTabId=app_purchase" rel="purchase_update" target="dialog" title="编辑"> ${varitem.title} </a> 
					</td>   
					<td>  ${varitem.quantity} 
						<span class="showDictLabel" dictType="PRICE_UNIT" dictCode="${varitem.priceUnit}"></span>
					</td>   
					<td> ${varitem.price} 
						<span class="showDictLabel" dictType="QUANTITY_UNIT" dictCode="${varitem.quantityUnit}"></span>
					</td>   
					<td> <fmt:formatDate value='${ varitem.publishTime}' pattern='yyyy-MM-dd'/> 
					</td>  
					<td><a title="编辑" target="dialog" rel="purchase_update" href="${ctx}/sys/purchase/update/${varitem.id}?navTabId=app_purchase" class="btnEdit">编辑</a> <a title="删除"
						target="ajaxTodo" href="${ctx}/sys/purchase/delete/${varitem.id}" class="btnDel">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<tag:pagination page="${page}" numPerPageOnchange="navTabPageBreak({numPerPage:this.value})"></tag:pagination>
	</div>
</div>

<script type="text/javascript" src="${ctx}/static/js/base/dict.js"></script>